// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ambulance/Services/firestore_services.dart';

import '../Services/google_maps_services.dart';
import '../constants.dart';

class AmbulanceListRepository {
  //Creates Ambulance list on Cloud Firestore
  static Future<void> createCollection(
    Map<String, dynamic> ambulanceListMap,
  ) async {
    try {
      FirestoreService.createCollection(
        collectionPath: ambulanceListCollectionPath,
        documentID: ambulanceListDocumentID,
        listKey: ambulanceListKey,
        map: ambulanceListMap,
      );
    } catch (e) {
      rethrow;
    }
  }

  //Fetches Ambulance List from Cloud Firestore
  static Future<Map<String, dynamic>> fetchDocument() async {
    try {
      final ambulanceListMap = FirestoreService.fetchDocument(
        collectionPath: ambulanceListCollectionPath,
        documentID: ambulanceListDocumentID,
      );
      return ambulanceListMap;
    } catch (e) {
      rethrow;
    }
  }

  //Gets Distance and Duration between two locations ie. User and Hospital
  static Future<Map<String, dynamic>> getDistanceAndDuration({
    required double originLat,
    required double originLng,
    required double destinationLat,
    required double destinationLng,
    required String googleMapsAPIKey,
  }) async {
    try {
      final result = GoogleMapsServices.getDistanceAndDuration(
        originLat: originLat,
        originLng: originLng,
        destinationLat: destinationLat,
        destinationLng: destinationLng,
        googleMapsAPIKey: googleMapsAPIKey,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
