// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ambulance/models/travel_distance_model.dart';
import 'package:ambulance/models/travel_duration_model.dart';

import 'driver_model.dart';
import 'hospital_model.dart';

class Ambulance {
  final TravelDistance distance;
  final TravelDuration duration;
  final String details;
  final Hospital hospital;
  final Driver driver;

  const Ambulance({
    required this.distance,
    required this.duration,
    required this.details,
    required this.hospital,
    required this.driver,
  });

  //Method that returns a map from an Ambulance Object
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'distance': distance.toMap(),
      'duration': duration.toMap(),
      'details': details,
      'hospital': hospital.toMap(),
      'driver': driver.toMap(),
    };
  }

  //Factory constructor that returns an Ambulance Object from a map
  factory Ambulance.fromMap(Map<String, dynamic> map) {
    return Ambulance(
      distance: TravelDistance.fromMap(map['distance'] as Map<String, dynamic>),
      duration: TravelDuration.fromMap(map['duration'] as Map<String, dynamic>),
      details: map['details'] as String,
      hospital: Hospital.fromMap(map['hospital'] as Map<String, dynamic>),
      driver: Driver.fromMap(map['driver'] as Map<String, dynamic>),
    );
  }

  Ambulance copyWith({
    TravelDistance? distance,
    TravelDuration? duration,
    String? details,
    Hospital? hospital,
    Driver? driver,
  }) {
    return Ambulance(
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      details: details ?? this.details,
      hospital: hospital ?? this.hospital,
      driver: driver ?? this.driver,
    );
  }
}
