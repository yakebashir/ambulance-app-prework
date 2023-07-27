// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ambulance/models/geocoordinates_model.dart';

class User {
  final String firstName;
  final String surname;
  final String phoneNumber;
  final String email;
  final GeoCoordinates? geoCoordinates;

  User({
    this.firstName = '',
    this.surname = '',
    this.phoneNumber = '',
    this.email = '',
    this.geoCoordinates,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'surname': surname,
      'phoneNumber': phoneNumber,
      'email': email,
      'geoCoordinates': geoCoordinates?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] as String,
      surname: map['surname'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      geoCoordinates: map['geoCoordinates'] != null
          ? GeoCoordinates.fromMap(
              map['geoCoordinates'] as Map<String, dynamic>)
          : null,
    );
  }
}
