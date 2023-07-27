import 'package:flutter/material.dart';

//Our Colors
const Color kEngineeringOrange = Color.fromRGBO(200, 0, 0, 1);
const Color kDarkEngineeringOrange = Color.fromRGBO(208, 23, 13, 1);
const Color kChilliRed = Color.fromRGBO(226, 25, 14, 1);
const Color kGold = Color.fromRGBO(255, 215, 0, 1);
const Color kWhite = Colors.white;
const Color kBlack = Colors.black87;
const Color kLightBlack = Colors.black54;
final Color kDarkGrey = Colors.grey.shade700;
const Color kGrey = Colors.grey;
final Color kLightGrey = Colors.grey.shade400;
final Color kVeryLightGrey = Colors.grey.shade100;

//TextStyle
const TextStyle kVioletHeaderStyle = TextStyle(color: kEngineeringOrange);

const TextStyle kBlackTextStyle = TextStyle(
  color: kBlack,
  fontWeight: FontWeight.normal,
  fontSize: 20,
);

const TextStyle kGreyHeaderStyle = TextStyle(
  color: kGrey,
  fontWeight: FontWeight.normal,
  fontSize: 22,
);

const TextStyle kButtonTextStyle = TextStyle(
  color: kWhite,
  fontWeight: FontWeight.w500,
  fontSize: 20,
);

//Elevation
const double kElevation = 5;

//BorderRadius
const double kRoundedBorderRadius = 30;

//Symmetric padding
const double kVerticalPadding = 30;
const double kHorizontalPadding = 20;

//Google maps locale
const String locale = 'ug';

//Enum that tells us the error status of any State Object
enum ErrorStatus {
  errorOccured,
  noError;

  //Method that makes a String from an enum
  String toMap() => name;
  //factory constructor that makes an enum from a string
  factory ErrorStatus.fromMap(String name) => ErrorStatus.values.byName(name);
}

//Enum that tells us the data status of any State Object
enum DataStatus {
  initial,
  loading,
  loaded;

  //Method that makes a String from an enum
  String toMap() => name;
  //factory constructor that makes an enum from a string
  factory DataStatus.fromMap(String name) => DataStatus.values.byName(name);
}

// String constants to our Cloud Firestore for Ambulance List
const String ambulanceListCollectionPath = 'ug ambulances';
const String ambulanceListDocumentID = 'list document ID';
const String ambulanceListKey = 'ambulanceList';

//String constants to our Cloud Firestore for District List
const String districtListCollectionPath = 'ug districts';
const String districtListDocumentID = 'list document ID';
const String districtListKey = 'districtList';
