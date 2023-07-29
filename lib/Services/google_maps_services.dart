// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:ambulance/constants.dart';
import 'package:ambulance/exceptions/custom_exception.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../models/suggestion_model.dart';

const String baseURL = 'https://maps.googleapis.com/maps/api/';
const uuid = Uuid();

class GoogleMapsServices {
  //Get suggestions of locations as user types
  static Future<List<Suggestion>> getSuggestion(
    String input, {
    String? locale,
    required String googleMapsAPIKey,
  }) async {
    if (input.isEmpty) return [];

    String sessionToken = uuid.v4();
    String autocompleteService = 'place/autocomplete/json';
    String localeComponent =
        locale != null ? " &components=country:$locale" : '';
    String request =
        '$baseURL$autocompleteService?input=$input&key=$googleMapsAPIKey&sessiontoken=$sessionToken$localeComponent';

    final response = await Dio().get(request);
    if (response.statusCode == 200) {
      final result = response.data;
      if (result['status'] == 'OK') {
        return result['predictions']
            .map<Suggestion>(
              (p) => Suggestion(
                placeId: p['place_id'],
                description: p['description'],
              ),
            )
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw CustomException(
        errorCode: 100,
        title: errorCodesMap[100][title],
        message: result['error_message'],
        errorOrigin: ErrorOrigins.notARepository,
      );
    } else {
      throw CustomException(
        errorCode: 101,
        title: errorCodesMap[101][title],
        message: 'Unknown error occured!',
        errorOrigin: ErrorOrigins.notARepository,
      );
    }
  }

  //Get details of a place using it's ID
  static Future<dynamic> getDetails({
    required placeId,
    required googleMapsAPIKey,
  }) async {
    String sessionToken = uuid.v4();
    String detailsService = 'place/details/json';
    String request =
        '$baseURL$detailsService?place_id=$placeId&key=$googleMapsAPIKey&sessiontoken=$sessionToken';

    final response = await Dio().get(request);
    if (response.statusCode == 200) {
      final result = response.data;
      if (result['status'] == 'OK') {
        return result;
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw CustomException(
        errorCode: 102,
        title: errorCodesMap[102][title],
        message: result['error_message'],
        errorOrigin: ErrorOrigins.notARepository,
      );
    } else {
      throw CustomException(
        errorCode: 103,
        title: errorCodesMap[103][title],
        message: 'Unknown error occured!',
        errorOrigin: ErrorOrigins.notARepository,
      );
    }
  }

  //Get distance and duration between  two places using their geo coordinates
  static Future<Map<String, dynamic>> getDistanceAndDuration({
    required double originLat,
    required double originLng,
    required double destinationLat,
    required double destinationLng,
    required String googleMapsAPIKey,
  }) async {
    const uuid = Uuid();
    String sessionToken = uuid.v4();
    String distanceMatrixService = 'distancematrix/json';
    String request =
        '$baseURL$distanceMatrixService?origins=$originLat,$originLng&destinations=$destinationLat,$destinationLng&key=$googleMapsAPIKey&sessiontoken=$sessionToken';

    final response = await Dio().get(request);
    if (response.statusCode == 200) {
      final result = response.data;
      if (result['status'] == 'OK') {
        return result;
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return {'error_message': 'No results found'};
      }
      throw CustomException(
        errorCode: 104,
        title: errorCodesMap[104][title],
        message: result['error_message'],
        errorOrigin: ErrorOrigins.notARepository,
      );
    } else {
      throw CustomException(
        errorCode: 105,
        title: errorCodesMap[105][title],
        message: 'Unknown error occured!',
        errorOrigin: ErrorOrigins.notARepository,
      );
    }
  }
}
