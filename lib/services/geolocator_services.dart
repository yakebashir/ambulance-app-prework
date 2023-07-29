import 'package:geolocator/geolocator.dart';

import '../constants.dart';
import '../exceptions/custom_exception.dart';

class GeolocatorServices {
  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    //Check to see if the permission has been granted
    permission = await Geolocator.checkPermission();
    //If permission has been denied, throw exception
    if (permission == LocationPermission.denied) {
      throw CustomException(
        errorCode: 200,
        title: errorCodesMap[200][title],
        message:
            'Location permission denied! The app needs to access location services in order to serve you. Please go to setttings and grant location permission.',
        errorOrigin: ErrorOrigins.notARepository,
      );
    } //else if permission has been denied forever, throw exception
    else if (permission == LocationPermission.deniedForever) {
      throw CustomException(
        errorCode: 201,
        title: errorCodesMap[201][title],
        message:
            'Location permission denied forever! The app needs to access location services in order to serve you. Please go to setttings and grant location permission.',
        errorOrigin: ErrorOrigins.notARepository,
      );
    }
    //Now that permission is granted, check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw CustomException(
        errorCode: 202,
        title: errorCodesMap[202][title],
        message:
            'Location service disabled! The app needs to access location services in order to serve you. Please switch on Location to continue.',
        errorOrigin: ErrorOrigins.notARepository,
      );
    }
    //Now that even location service is on, get current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
  }

  static Future<void> getLocationPermission() async {
    //Request permission
    await Geolocator.requestPermission();
  }

  //This is what we do in response to location service disabled
  static Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }
}
