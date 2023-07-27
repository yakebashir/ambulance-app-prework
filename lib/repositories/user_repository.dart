import '../Services/google_maps_services.dart';

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
    } catch (e) {
      rethrow;
    }
  }
}
