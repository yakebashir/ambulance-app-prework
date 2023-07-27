// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ambulance/models/geocoordinates_model.dart';

class Hospital {
  final String name;
  final String district;
  final GeoCoordinates geoCoordinates;

  const Hospital({
    required this.name,
    required this.district,
    required this.geoCoordinates,
  });

  //Method that returns a map from a Hospital Object
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'district': district,
      'geoCoordinates': geoCoordinates.toMap(),
    };
  }

  //Factory named constructor that makes Hospital Object from a map
  factory Hospital.fromMap(Map<String, dynamic> map) {
    return Hospital(
      name: map['name'] as String,
      district: map['district'] as String,
      geoCoordinates:
          GeoCoordinates.fromMap(map['geoCoordinates'] as Map<String, dynamic>),
    );
  }
}
