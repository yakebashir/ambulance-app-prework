// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ambulance/models/geocoordinates_model.dart';

class User {
  final String firstName;
  final String surname;
  final String phoneNumber;
  final String email;
  final String pickUpLocation;
  final GeoCoordinates? geoCoordinates;

  User({
    this.firstName = '',
    this.surname = '',
    this.phoneNumber = '',
    this.email = '',
    this.pickUpLocation = '',
    this.geoCoordinates,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'surname': surname,
      'phoneNumber': phoneNumber,
      'email': email,
      'pickUpLocation': pickUpLocation,
      'geoCoordinates': geoCoordinates?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] as String,
      surname: map['surname'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      pickUpLocation: map['pickUpLocation'] as String,
      geoCoordinates: map['geoCoordinates'] != null
          ? GeoCoordinates.fromMap(
              map['geoCoordinates'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() {
    return 'User(firstName: $firstName, surname: $surname, phoneNumber: $phoneNumber, email: $email, pickUpLocation: $pickUpLocation, geoCoordinates: $geoCoordinates)';
  }

  User copyWith({
    String? firstName,
    String? surname,
    String? phoneNumber,
    String? email,
    String? pickUpLocation,
    GeoCoordinates? geoCoordinates,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      surname: surname ?? this.surname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      pickUpLocation: pickUpLocation ?? this.pickUpLocation,
      geoCoordinates: geoCoordinates ?? this.geoCoordinates,
    );
  }
}
