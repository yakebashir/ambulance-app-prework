// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'district_list_cubit.dart';

class DistrictListState extends Equatable {
  final List<District> districtList;
  final ErrorStatus errorStatus;
  final DataStatus dataStatus;

  const DistrictListState({
    required this.districtList,
    required this.errorStatus,
    required this.dataStatus,
  });

  factory DistrictListState.initial() {
    return DistrictListState(
      districtList: initialDistrictList,
      errorStatus: ErrorStatus.noError,
      dataStatus: DataStatus.initial,
    );
  }

  @override
  List<Object> get props => [districtList, errorStatus, dataStatus];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'districtList': districtList.map((x) => x.toMap()).toList(),
      'errorStatus': errorStatus.toMap(),
      'dataStatus': dataStatus.toMap(),
    };
  }

  factory DistrictListState.fromMap(Map<String, dynamic> map) {
    return DistrictListState(
      districtList: List<District>.from(
        (map['districtList'] as List<dynamic>).map<District>(
          (x) => District.fromMap(x),
        ),
      ),
      errorStatus: ErrorStatus.fromMap(map['errorStatus'] as String),
      dataStatus: DataStatus.fromMap(map['dataStatus'] as String),
    );
  }

  DistrictListState copyWith({
    List<District>? districtList,
    ErrorStatus? errorStatus,
    DataStatus? dataStatus,
  }) {
    return DistrictListState(
      districtList: districtList ?? this.districtList,
      errorStatus: errorStatus ?? this.errorStatus,
      dataStatus: dataStatus ?? this.dataStatus,
    );
  }
}

final List<District> initialDistrictList = [
  const District(
    name: 'Kampala',
    ambulanceCount: 4,
    geoCoordinates: GeoCoordinates(
      latitude: 0.3250394,
      longitude: 32.5856675,
    ),
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
  ),
  const District(
    name: 'Mukono',
    ambulanceCount: 2,
    geoCoordinates: GeoCoordinates(
      latitude: 0.2835476,
      longitude: 32.7633036,
    ),
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
  ),
  const District(
    name: 'Mbarara',
    ambulanceCount: 1,
    geoCoordinates: GeoCoordinates(
      latitude: -0.4852564,
      longitude: 30.5739579,
    ),
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
  ),
  const District(
    name: 'Wakiso',
    ambulanceCount: 1,
    geoCoordinates: GeoCoordinates(
      latitude: 0.06301899999999999,
      longitude: 32.4467238,
    ),
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
  ),
];
