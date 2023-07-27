import 'dart:async';
import '../../config.dart';
import '../../constants.dart';
import '../../models/geocoordinates_model.dart';
import '../../models/travel_distance_model.dart';
import '../../models/travel_duration_model.dart';
import '../user/user_cubit.dart';
import '../../models/district_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/district_list_repository.dart';

part 'district_list_state.dart';

class DistrictListCubit extends Cubit<DistrictListState> {
  final UserCubit userCubit;
  late final StreamSubscription userStreamSubscription;
  DistrictListCubit({
    required this.userCubit,
  }) : super(DistrictListState.initial()) {
    userStreamSubscription = userCubit.stream.listen((userState) async {
      if (userState.dataStatus == DataStatus.loaded) {
        await fetchList();
        await getDistanceAndDuration();
        print(state.toMap());
      }
    });
  }

  @override
  Future<void> close() {
    // Close the stream subscription when the Bloc is closed
    userStreamSubscription.cancel();
    return super.close();
  }

  //Method that uses FirestoreServices to store our list of districts. Single Use.
  Future<void> createOrUpdateList() async {
    try {
      await DistrictListRepository.createCollection(state.toMap());
    } catch (e) {
      /*Not typical but since this method is just ours for use and we'll delete it before porting 
      the app, errors are unlikely to happen and if they do, we can handle them*/
      rethrow;
    }
  }

  //Fetches District list from cloud firestore and emits new states as they occur
  Future<void> fetchList() async {
    //Note: ensure that ErrorStatus is reset before loading again. Can reset it here or in a dialog box
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
      errorStatus: ErrorStatus.noError,
    ));
    try {
      var districtListMap = await DistrictListRepository.fetchDocument();
      districtListMap = districtListMap[districtListKey];
      emit(
        state.copyWith(
          districtList: DistrictListState.fromMap(districtListMap).districtList,
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

  //Get distance and duration between user and hospital
  Future<void> getDistanceAndDuration() async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    try {
      final user = userCubit.state.user;
      late List<District> newList;
      final districtList = state.districtList;
      for (int i = 0; i < districtList.length; i++) {
        final result = await DistrictListRepository.getDistanceAndDuration(
          originLat: user.geoCoordinates!.latitude,
          originLng: user.geoCoordinates!.longitude,
          destinationLat: districtList[i].geoCoordinates.latitude,
          destinationLng: districtList[i].geoCoordinates.longitude,
          googleMapsAPIKey: gMapsAPIKey,
        );
        final distanceMap = result['rows'][0]['elements'][0]['distance'];
        final durationMap = result['rows'][0]['elements'][0]['duration'];
        newList = districtList;
        newList[i] = newList[i].copyWith(
          distance: TravelDistance.fromMap(distanceMap),
          duration: TravelDuration.fromMap(durationMap),
        );
      }
      emit(state.copyWith(districtList: newList));
      //Get districts with max ie 10 closest ambulances
      getClosestDistrictsToDisplay();
    } catch (e) {
      emit(
        state.copyWith(
          errorStatus: ErrorStatus.errorOccured,
          dataStatus: DataStatus.initial,
        ),
      );
    }
  }

  //NOTE: Method below is called right after getDistanceAndDuration();
  //Get districts with max ie 10 closest ambulances
  void getClosestDistrictsToDisplay() {
    final districtList = state.districtList;
    //Sort district list in order of shortest to highest duration
    districtList.sort((a, b) => b.duration.value.compareTo(a.duration.value));
    List<District> newList = [];
    const int maxAmbulancesToDisplay = 10;
    //Select enough districts to make max ambulances to display. This will help us limit google maps api calls
    for (int i = 0; i < districtList.length; i++) {
      //Add a district to our new list each time
      newList.add(districtList[i]);
      //Reset the ambulance count sum to 0 each time
      int ambulanceCountSum = 0;
      //Sum up the ambulances in the selected districts
      for (int j = 0; j < newList.length; j++) {
        ambulanceCountSum += newList[j].ambulanceCount;
      }
      //If the ambulances are more or same as max to display, make this our new district list
      if (ambulanceCountSum >= maxAmbulancesToDisplay) {
        emit(state.copyWith(districtList: newList));
        //Then exit function
        return;
      }
    }
    //If our ambulance list has less than max ambulances to display like in our case, old list remains
  }
}
