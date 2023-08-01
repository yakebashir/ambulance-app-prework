import '../constants.dart';
import '../exceptions/custom_exception.dart';
import '../services/firestore_services.dart';
import '../services/google_maps_services.dart';

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
    } on CustomException catch (e) {
      throw e.copyWith(errorOrigin: ErrorOrigins.districtListRepository);
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
    } on CustomException catch (e) {
      throw e.copyWith(errorOrigin: ErrorOrigins.districtListRepository);
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
    } on CustomException catch (e) {
      throw e.copyWith(errorOrigin: ErrorOrigins.districtListRepository);
    }
    
  }
}
