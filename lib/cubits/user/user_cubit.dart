import 'dart:async';
import 'dart:developer';
import 'package:ambulance/exceptions/custom_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../models/geocoordinates_model.dart';
import '../../models/user_model.dart';
import '../../repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  UserCubit() : super(UserState.initial());

  Future<void> getDetails({
    required suggestion,
    required googleMapsAPIKey,
  }) async {
    //Ensure that the geoCoordinates are made null before this method runs because the DistrictLitsCubit's listening logic depends on it
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
      exception: emptyException,
      user: state.user.copyWith(geoCoordinates: null),
    ));
    try {
      final result = await UserRepository.getDetails(
        placeId: suggestion.placeId,
        googleMapsAPIKey: googleMapsAPIKey,
      );
      emit(
        state.copyWith(
          user: User(
            pickUpLocation: suggestion.description,
            geoCoordinates: GeoCoordinates(
              latitude: result["result"]["geometry"]["location"]["lat"],
              longitude: result["result"]["geometry"]["location"]["lng"],
            ),
          ),
          dataStatus: DataStatus.loaded,
        ),
      );
      log('UserState : ${state.toMap()}');
    } on CustomException catch (e) {
      emit(
        state.copyWith(
          exception: e,
          dataStatus: DataStatus.error,
        ),
      );
      rethrow;
    }
  }

  Future<void> getLocationPermission() async {
    //Request permission
    await UserRepository.getLocationPermission();
  }

  Future<void> getCurrentPosition() async {
    emit(state.copyWith(
      exception: emptyException,
      dataStatus: DataStatus.loading,
    ));
    try {
      final currentPosition = await UserRepository.getCurrentPosition();
      emit(state.copyWith(
        user: User(
          pickUpLocation: 'Current Location',
          geoCoordinates: GeoCoordinates(
            latitude: currentPosition.latitude,
            longitude: currentPosition.longitude,
          ),
        ),
        dataStatus: DataStatus.loaded,
      ));
      log('UserState : ${state.toMap()}');
    } on CustomException catch (e) {
      emit(state.copyWith(
        exception: e,
        dataStatus: DataStatus.error,
      ));
      rethrow;
    }
  }

  //This is what we do in response to location service disabled
  Future<void> openLocationSettings() async {
    await UserRepository.openLocationSettings();
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    try {
      await UserRepository.makePhoneCall(phoneNumber);
    } on CustomException catch (e) {
      emit(state.copyWith(dataStatus: DataStatus.error, exception: e));
    }
  }
}

//Method is nolonger used
// String getDistrictFromResult(
//   dynamic result,
// ) {
//   final addressComponents = result['result']['address_components'];
//   for (var i = 0; i < addressComponents.length; i++) {
//     final type0 = addressComponents[i]['types'][0];
//     if (type0 != [] && type0 == 'administrative_area_level_2') {
//       return addressComponents[i]['long_name'] ?? 'Unknown';
//     }
//   }
//   return 'Unknown';
// }
