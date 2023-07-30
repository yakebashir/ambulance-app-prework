import '../Services/geolocator_services.dart';
import '../services/call_services.dart';
import 'package:geolocator/geolocator.dart';

import '../constants.dart';
import '../exceptions/custom_exception.dart';
import '../services/google_maps_services.dart';

class UserRepository {
  //Get details of a user's selected location using its placeId
  static Future<dynamic> getDetails({
    required placeId,
    required googleMapsAPIKey,
  }) async {
    try {
      final result = await GoogleMapsServices.getDetails(
        placeId: placeId,
        googleMapsAPIKey: googleMapsAPIKey,
      );
      return result;
    } on CustomException catch (e) {
      throw e.copyWith(errorOrigin: ErrorOrigins.userRepository);
    }
  }

  static Future<void> getLocationPermission() async {
    //Request permission
    await GeolocatorServices.getLocationPermission();
  }

  static Future<Position> getCurrentPosition() async {
    try {
      return await GeolocatorServices.getCurrentPosition();
    } on CustomException catch (e) {
      throw e.copyWith(errorOrigin: ErrorOrigins.userRepository);
    }
  }

  //This is what we do in response to location service disabled
  static Future<void> openLocationSettings() async {
    await GeolocatorServices.openLocationSettings();
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    try {
      await CallServices.makePhoneCall(phoneNumber);
    } on CustomException catch (e) {
      throw e.copyWith(errorOrigin: ErrorOrigins.userRepository);
    }
  }
}
