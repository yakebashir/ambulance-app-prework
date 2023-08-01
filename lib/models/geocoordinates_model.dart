// ignore_for_file: public_member_api_docs, sort_constructors_first

class GeoCoordinates {
  final double latitude;
  final double longitude;

  const GeoCoordinates({
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() {
    return 'Coordinates(latitude: $latitude, longitude: $longitude)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory GeoCoordinates.fromMap(Map<String, dynamic> map) {
    return GeoCoordinates(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }
}
