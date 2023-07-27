// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ambulance_list_cubit.dart';

@immutable
class AmbulanceListState extends Equatable {
  final List<Ambulance> ambulanceList;
  final ErrorStatus errorStatus;
  final DataStatus dataStatus;

  //Constructor
  const AmbulanceListState({
    required this.ambulanceList,
    required this.errorStatus,
    required this.dataStatus,
  });

  factory AmbulanceListState.initial() {
    return AmbulanceListState(
      ambulanceList: initialAmbulanceList,
      errorStatus: ErrorStatus.noError,
      dataStatus: DataStatus.initial,
    );
  }

  //Required override for the Equatable class
  @override
  List<Object?> get props => [ambulanceList, errorStatus, dataStatus];

  //Override of the toString method of the Equatable class
  @override
  bool get stringify => true;

  //Method that converts the ambulance list to a map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ambulanceList': ambulanceList.map((x) => x.toMap()).toList(),
      'errorStatus': errorStatus.toMap(),
      'dataStatus': dataStatus.toMap(),
    };
  }

  //Factory constructor that returns AmbulanceListState from a map
  factory AmbulanceListState.fromMap(Map<String, dynamic> map) {
    return AmbulanceListState(
        ambulanceList: List<Ambulance>.from(
          (map['ambulanceList'] as List<dynamic>).map<Ambulance>(
            (x) => Ambulance.fromMap(x),
          ),
        ),
        errorStatus: ErrorStatus.fromMap(map['errorStatus'] as String),
        dataStatus: DataStatus.fromMap(map['dataStatus'] as String));
  }

  AmbulanceListState copyWith({
    List<Ambulance>? ambulanceList,
    ErrorStatus? errorStatus,
    DataStatus? dataStatus,
  }) {
    return AmbulanceListState(
      ambulanceList: ambulanceList ?? this.ambulanceList,
      errorStatus: errorStatus ?? this.errorStatus,
      dataStatus: dataStatus ?? this.dataStatus,
    );
  }
}

List<Ambulance> initialAmbulanceList = [
  const Ambulance(
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
    details:
        'International Hospital Kampala is a leading healthcare institution in Uganda, renowned for its state-of-the-art medical facilities and compassionate patient care. With a team of skilled medical professionals and cutting-edge technology, it strives to provide high-quality and comprehensive healthcare services to both local and international patients, promoting wellness and healing.',
    hospital: Hospital(
      name: 'International Hospital Kampala',
      district: 'Kampala',
      geoCoordinates: GeoCoordinates(
        latitude: 0.3047183,
        longitude: 32.6112477,
      ),
    ),
    driver: Driver(
      name: ' ',
      gender: ' ',
      airtelNumber: '031 2200400',
    ),
  ),
  const Ambulance(
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
    details:
        'Norvik Hospital stands as a prominent healthcare provider, delivering exceptional medical services in a welcoming environment. With a focus on innovation and patient-centric care, Norvik Hospital houses proficient specialists and modern facilities, ensuring the well-being of patients and promoting healthier communities.',
    hospital: Hospital(
      name: 'Norvik Hospital',
      district: 'Kampala',
      geoCoordinates: GeoCoordinates(
        latitude: 0.323293,
        longitude: 32.5744867,
      ),
    ),
    driver: Driver(
      name: ' ',
      gender: ' ',
      airtelNumber: '+256707594254',
    ),
  ),
  const Ambulance(
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
    details:
        'Jehova Rapha Clinic is a trusted medical center dedicated to healing and compassion. With a strong emphasis on faith-based principles, it offers personalized healthcare services that prioritize the physical, emotional, and spiritual well-being of patients. The clinic\'s skilled team and nurturing environment foster hope and recovery for all who seek its care.',
    hospital: Hospital(
      name: 'Jehova Rapha Hospital',
      district: 'Mukono',
      geoCoordinates: GeoCoordinates(
        latitude: 0.4725324,
        longitude: 32.7545926,
      ),
    ),
    driver: Driver(
      name: ' ',
      gender: ' ',
      airtelNumber: '+256740006049',
    ),
  ),
  const Ambulance(
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
    details:
        'Mengo Hospital is a leading healthcare institution in Uganda, committed to excellence in patient care since 1897. With a rich history of service and continuous innovation, it provides top-notch medical expertise and cutting-edge facilities, catering to diverse medical needs and contributing significantly to the country\'s healthcare landscape.',
    hospital: Hospital(
      name: 'Mengo Hospital',
      district: 'Kampala',
      geoCoordinates: GeoCoordinates(
        latitude: 0.3132007999999999,
        longitude: 32.5290849,
      ),
    ),
    driver: Driver(
      name: ' ',
      gender: ' ',
      airtelNumber: '041 4270222',
    ),
  ),
  const Ambulance(
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
    details:
        'Mulago Hospital, located in Kampala, Uganda, is a prominent referral medical facility. Established in 1913, it has played a crucial role in providing essential healthcare services to the nation. With skilled professionals and comprehensive resources, Mulago Hospital continues to be a pillar of healthcare, serving a wide spectrum of patients with dedication and compassion.',
    hospital: Hospital(
      name: 'Mulago Hospital',
      district: 'Kampala',
      geoCoordinates: GeoCoordinates(
        latitude: 0.3410764000000001,
        longitude: 32.5769204,
      ),
    ),
    driver: Driver(
      name: ' ',
      gender: ' ',
      airtelNumber: '+256414554008',
    ),
  ),
  const Ambulance(
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
    details:
        'Naggalama Hospital is a respected healthcare center situated in Uganda, dedicated to serving local communities since its inception. With a focus on patient well-being, it offers a range of medical services and employs qualified staff, ensuring accessible and quality healthcare to the people it serves, making a positive impact on public health.',
    hospital: Hospital(
      name: 'Naggalama Hospital',
      district: 'Mukono',
      geoCoordinates: GeoCoordinates(
        latitude: 0.516,
        longitude: 32.775,
      ),
    ),
    driver: Driver(
      name: ' ',
      gender: ' ',
      airtelNumber: '0392 702 709',
    ),
  ),
  const Ambulance(
    distance: TravelDistance(
      text: '0 km',
      value: 0,
    ),
    duration: TravelDuration(
      text: '0 km',
      value: 0,
    ),
    details:
        'Mbarara Hospital is a prominent healthcare institution in southwestern Uganda, committed to providing exceptional medical care and services. With a long-standing history and a skilled team of professionals, it offers state-of-the-art facilities, focusing on patient well-being, medical education, and research to improve healthcare outcomes in the region.',
    hospital: Hospital(
      name: 'Mbarara Hospital',
      district: 'Mbarara',
      geoCoordinates: GeoCoordinates(
        latitude: -0.6170591,
        longitude: 30.65766249999999,
      ),
    ),
    driver: Driver(
      name: ' ',
      gender: ' ',
      airtelNumber: '0485 421 086',
    ),
  ),
  const Ambulance(
    distance: TravelDistance(text: '0 km', value: 0),
    duration: TravelDuration(text: '0 km', value: 0),
    details:
        'St. Joseph\'s Hospital Wakiso is a leading medical facility in the Wakiso district, Uganda. Renowned for its compassionate care and advanced medical services, the hospital offers a wide range of healthcare solutions to the local community. With a team of dedicated professionals, it strives to improve health outcomes and promote well-being.',
    hospital: Hospital(
      name: 'St. Joseph\'s Hospital Wakiso',
      district: 'Wakiso',
      geoCoordinates: GeoCoordinates(
        latitude: 0.5539196999999999,
        longitude: 32.63671790000001,
      ),
    ),
    driver: Driver(
      name: 'John',
      gender: 'Male',
      airtelNumber: '0759 039795',
    ),
  ),
];
