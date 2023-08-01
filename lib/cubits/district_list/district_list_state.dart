// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'district_list_cubit.dart';

class DistrictListState extends Equatable {
  final List<District> districtList;
  final DataStatus dataStatus;
  final CustomException exception;
  final bool hasFetchedList;

  const DistrictListState({
    required this.districtList,
    required this.dataStatus,
    required this.exception,
    this.hasFetchedList = false,
  });

  factory DistrictListState.initial() {
    return DistrictListState(
      districtList: const [],
      dataStatus: DataStatus.initial,
      exception: emptyException,
    );
  }
  
  @override
  List<Object?> get props =>
      [districtList, dataStatus, exception, hasFetchedList];

  @override
  bool get stringify => true;

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'districtList': districtList.map((x) => x.toMap()).toList(),
      'dataStatus': dataStatus.toMap(),
      'exception': exception.toMap(),
      'hasFetchedList': hasFetchedList,
    };
  }

  factory DistrictListState.fromMap(Map<String, dynamic> map) {
    return DistrictListState(
      districtList: List<District>.from(
        (map['districtList'] as List<dynamic>).map<District>(
          (x) => District.fromMap(x as Map<String, dynamic>),
        ),
      ),
      dataStatus: DataStatus.fromMap(map['dataStatus'] as String),
      exception:
          CustomException.fromMap(map['exception'] as Map<String, dynamic>),
      hasFetchedList: map['hasFetchedList'] as bool,
    );
  }

  DistrictListState copyWith({
    List<District>? districtList,
    DataStatus? dataStatus,
    CustomException? exception,
    bool? hasFetchedList,
  }) {
    return DistrictListState(
      districtList: districtList ?? this.districtList,
      dataStatus: dataStatus ?? this.dataStatus,
      exception: exception ?? this.exception,
      hasFetchedList: hasFetchedList ?? this.hasFetchedList,
    );
  }
}

//Our list of districts
// final List<District> initialDistrictList = [
//   const District(
//     name: 'Kampala',
//     ambulanceCount: 4,
//     geoCoordinates: GeoCoordinates(
//       latitude: 0.3250394,
//       longitude: 32.5856675,
//     ),
//     distance: TravelDistance(
//       text: '0 km',
//       value: 0,
//     ),
//     duration: TravelDuration(
//       text: '0 km',
//       value: 0,
//     ),
//   ),
//   const District(
//     name: 'Mukono',
//     ambulanceCount: 2,
//     geoCoordinates: GeoCoordinates(
//       latitude: 0.2835476,
//       longitude: 32.7633036,
//     ),
//     distance: TravelDistance(
//       text: '0 km',
//       value: 0,
//     ),
//     duration: TravelDuration(
//       text: '0 km',
//       value: 0,
//     ),
//   ),
//   const District(
//     name: 'Mbarara',
//     ambulanceCount: 1,
//     geoCoordinates: GeoCoordinates(
//       latitude: -0.4852564,
//       longitude: 30.5739579,
//     ),
//     distance: TravelDistance(
//       text: '0 km',
//       value: 0,
//     ),
//     duration: TravelDuration(
//       text: '0 km',
//       value: 0,
//     ),
//   ),
//   const District(
//     name: 'Wakiso',
//     ambulanceCount: 1,
//     geoCoordinates: GeoCoordinates(
//       latitude: 0.06301899999999999,
//       longitude: 32.4467238,
//     ),
//     distance: TravelDistance(
//       text: '0 km',
//       value: 0,
//     ),
//     duration: TravelDuration(
//       text: '0 km',
//       value: 0,
//     ),
//   ),
// ];
