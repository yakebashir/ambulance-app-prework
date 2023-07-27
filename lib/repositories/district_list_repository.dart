import '../Services/firestore_services.dart';
import '../Services/google_maps_services.dart';
import '../constants.dart';

class DistrictListRepository {
  //Creates District list on Cloud Firestore
  static Future<void> createCollection(
    Map<String, dynamic> ambulanceListMap,
  ) async {
    try {
      FirestoreService.createCollection(
        collectionPath: districtListCollectionPath,
        documentID: districtListDocumentID,
        listKey: districtListKey,
        map: ambulanceListMap,
      );
    } catch (e) {
      rethrow;
    }
  }

  //Fetches District List from Cloud Firestore
  static Future<Map<String, dynamic>> fetchDocument() async {
    try {
      final districtListMap = FirestoreService.fetchDocument(
        collectionPath: districtListCollectionPath,
        documentID: districtListDocumentID,
      );
      return districtListMap;
    } catch (e) {
      rethrow;
    }
  }

  //Gets Distance and Duration between two locations ie. User and District
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
