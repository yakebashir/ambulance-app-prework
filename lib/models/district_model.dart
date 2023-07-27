// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ambulance/models/geocoordinates_model.dart';
import 'package:ambulance/models/travel_distance_model.dart';
import 'package:ambulance/models/travel_duration_model.dart';

class District {
  final String name;
  final int ambulanceCount;
  final GeoCoordinates geoCoordinates;
  final TravelDistance distance;
  final TravelDuration duration;

  const District({
    required this.name,
    required this.ambulanceCount,
    required this.geoCoordinates,
    required this.distance,
    required this.duration,
  });

  //Converts District Object to a map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ambulanceCount': ambulanceCount,
      'geoCoordinates': geoCoordinates.toMap(),
      'distance': distance.toMap(),
      'duration': duration.toMap(),
    };
  }

  //Makes District Object from a map
  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      name: map['name'] as String,
      ambulanceCount: map['ambulanceCount'] as int,
      geoCoordinates:
          GeoCoordinates.fromMap(map['geoCoordinates'] as Map<String, dynamic>),
      distance: TravelDistance.fromMap(map['distance'] as Map<String, dynamic>),
      duration: TravelDuration.fromMap(map['duration'] as Map<String, dynamic>),
    );
  }

  District copyWith({
    String? name,
    int? ambulanceCount,
    GeoCoordinates? geoCoordinates,
    TravelDistance? distance,
    TravelDuration? duration,
  }) {
    return District(
      name: name ?? this.name,
      ambulanceCount: ambulanceCount ?? this.ambulanceCount,
      geoCoordinates: geoCoordinates ?? this.geoCoordinates,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
    );
  }
}
