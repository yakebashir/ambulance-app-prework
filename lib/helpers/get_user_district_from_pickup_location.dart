//Method is nolonger used
//This method gets user's district from the results got after using selected suggestion's placeId
//The app's logic nolonger requires it so it is just saved here because it is pretty.
String getDistrictFromResult(
  dynamic result,
) {
  final addressComponents = result['result']['address_components'];
  for (var i = 0; i < addressComponents.length; i++) {
    final type0 = addressComponents[i]['types'][0];
    if (type0 != [] && type0 == 'administrative_area_level_2') {
      return addressComponents[i]['long_name'] ?? 'Unknown';
    }
  }
  return 'Unknown';
}
