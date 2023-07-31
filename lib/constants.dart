import 'package:flutter/material.dart';
import 'exceptions/custom_exception.dart';

//Colors
const Color kRed = Color.fromRGBO(200, 0, 0, 1);
const Color kRedShade = Color.fromRGBO(14, 0, 0, 1);
const Color kRedTint = Color.fromRGBO(255, 233, 233, 1);
const Color kGold = Color.fromRGBO(255, 215, 0, 1);
const Color kWhite = Colors.white;
const Color kBlack = Colors.black87;
//const Color kBlackTint = Colors.black54;
final Color kGreyShade = Colors.grey.shade600;
const Color kGrey = Colors.grey;
//final Color kLightGrey = Colors.grey.shade400;
final Color kGreyTint = Colors.grey.shade300;

//TextStyles
const TextStyle kVioletHeaderStyle = TextStyle(color: kRed);
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

//Enum that tells us the data status of any State Object
enum DataStatus {
  initial,
  loading,
  loaded,
  error;

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


//Error related variables
//map key stored
const String title = 'title';
//Error Codes
const Map<int, dynamic> errorCodesMap = {
  //Internet error code
  98: {title: 'No internet! Please reconnect.'},
  //System error code
  99: {title: 'An error occured!'},
  //Google maps error codes
  100: {title: 'Failed to get location suggestions!'},
  101: {title: 'An error occured while getting location suggestions!'},
  102: {title: 'Failed to get input location details!'},
  103: {title: 'An error occured while getting input location details!'},
  104: {title: 'Failed to get distance and duration!'},
  105: {title: 'An error occured while getting distance and location!'},
  //Geolocator error codes
  200: {title: 'Location permission denied!'},
  201: {title: 'Location permission denied forever!'},
  202: {title: 'Location service disabled!'},
  //Firestore error codes
  300: {title: 'Failed to create firestore collection!'},
  301: {title: 'An error occured during firestore collection creation!'},
  302: {title: 'Failed to fetch data from firestore!'},
  303: {title: 'An error occured while fetching data from firestore!'},
  //Call service error codes
  400: {title: 'An error occured while trying to make call!'},
  //Below are error codes for combined exceptions
  500: {title: 'Not connected to the internet'},
  501: {title: 'Not connected to the internet'},
  502: {title: 'Not connected to the internet'},
  503: {title: 'Not connected to the internet'},
};

//Empty exception
final emptyException = CustomException(
  errorCode: 0,
  title: '',
  message: '',
  errorOrigin: ErrorOrigins.notARepository,
);

//Error Origins
enum ErrorOrigins {
  userRepository,
  districtListRepository,
  ambulanceListRepository,
  internetServicesRepository,
  //One repository that doesn't exist to use as a place holder
  notARepository;

  String toMap() => name;
  factory ErrorOrigins.fromMap(String name) => ErrorOrigins.values.byName(name);
}

//Max number of ambulances to display
const int maxAmbulancesToDisplay = 10;

//Max lines on which to display ambulance details before show more is pressed
const int maxLines = 2;
