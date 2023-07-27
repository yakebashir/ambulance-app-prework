import 'dart:async';

import '../../models/geocoordinates_model.dart';
import '../district_list/district_list_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config.dart';
import '../../constants.dart';
import '../../models/ambulance_model.dart';
import '../../models/driver_model.dart';
import '../../models/hospital_model.dart';
import '../../models/travel_distance_model.dart';
import '../../models/travel_duration_model.dart';
import '../../repositories/ambulance_list_repository.dart';
import '../user/user_cubit.dart';

part 'ambulance_list_state.dart';

class AmbulanceListCubit extends Cubit<AmbulanceListState> {
  final UserCubit userCubit;
  final DistrictListCubit districtListCubit;
  late final StreamSubscription districtListStreamSubscription;

  AmbulanceListCubit({
    required this.userCubit,
    required this.districtListCubit,
  }) : super(AmbulanceListState.initial()) {
    districtListStreamSubscription =
        districtListCubit.stream.listen((distanceListState) async {
      if (distanceListState.districtList[0].distance.value != 0 &&
          distanceListState.districtList[1].distance.value != 0) {
        await fetchList();
        await getDistanceAndDuration();
        print(state.toMap());
      }
    });
  }

  @override
  Future<void> close() {
    // Close the stream subscription when the Bloc is closed
    districtListStreamSubscription.cancel();
    return super.close();
  }

  //Method that uses FirestoreServices to store our list of ambulances. Single Use.
  Future<void> createOrUpdateList() async {
    try {
      await AmbulanceListRepository.createCollection(state.toMap());
    } catch (e) {
      /*Not typical but since this method is just ours for use and we'll delete it before porting 
      the app, errors are unlikely to happen and if they do, we can handle them*/
      rethrow;
    }
  }

  //Fetches Ambulance list from cloud firestore and emits new states as they occur
  Future<void> fetchList() async {
    //Note: ensure that ErrorStatus is reset before loading again. Can reset it here or in a dialog box
    emit(state.copyWith(dataStatus: DataStatus.loading));
    try {
      var ambulanceListMap = await AmbulanceListRepository.fetchDocument();
      ambulanceListMap = ambulanceListMap[ambulanceListKey];
      emit(
        state.copyWith(
          ambulanceList:
              AmbulanceListState.fromMap(ambulanceListMap).ambulanceList,
          dataStatus: DataStatus.loaded,
        ),
      );
    } catch (e) {
      //If data fails to load, it goes back to initial state. ErrorStatus reflects the error
      emit(
        state.copyWith(
          errorStatus: ErrorStatus.errorOccured,
          dataStatus: DataStatus.initial,
        ),
      );
    }
  }

  //Allows us to get distance and duration between a user's chosen location and the hospital
  Future<void> getDistanceAndDuration() async {
    final user = userCubit.state.user;
    try {
      final ambulanceList = state.ambulanceList;
      late List<Ambulance> newList;
      for (int i = 0; i < ambulanceList.length; i++) {
        final result = await AmbulanceListRepository.getDistanceAndDuration(
          originLat: user.geoCoordinates!.latitude,
          originLng: user.geoCoordinates!.longitude,
          destinationLat: ambulanceList[i].hospital.geoCoordinates.latitude,
          destinationLng: ambulanceList[i].hospital.geoCoordinates.longitude,
          googleMapsAPIKey: gMapsAPIKey,
        );
        final distanceMap = result['rows'][0]['elements'][0]['distance'];
        final durationMap = result['rows'][0]['elements'][0]['duration'];
        newList = ambulanceList;
        newList[i] = newList[i].copyWith(
          distance: TravelDistance.fromMap(distanceMap),
          duration: TravelDuration.fromMap(durationMap),
        );
      }
      emit(state.copyWith(ambulanceList: newList));
      filterListForDisplay();
    } catch (e) {
      emit(
        state.copyWith(
          errorStatus: ErrorStatus.errorOccured,
          dataStatus: DataStatus.initial,
        ),
      );
    }
  }

  //Sort list in preperation for display
  void filterListForDisplay() {
    //Our new filtered list
    List<Ambulance> newList = [];
    //Current district list
    final districtList = districtListCubit.state.districtList;
    //Current ambulance list
    final ambulanceList = state.ambulanceList;
    //For each district in district list
    for (var district in districtList) {
      //Make a temporary ambulance list with the district name
      final tempAmbulanceList = ambulanceList
          .where((e) => e.hospital.district == district.name)
          .toList();
      //Add the newly made list to our new list
      newList.addAll(tempAmbulanceList);
    }
    //Our new list now only has max ie 10 ambulances from closest selected districts
    newList.sort((a, b) => a.duration.value.compareTo(b.duration.value));
    //Emit this new sorted list as our current ambulance list
    emit(state.copyWith(ambulanceList: newList));
  }
}
