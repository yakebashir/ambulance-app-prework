// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'internet_services_cubit.dart';

enum InternetStatus {
  initial,
  connected,
  disconnected;

  //Enum to Map
  String toMap() => name;
  //Map to Enum
  factory InternetStatus.fromMap(String name) {
    return InternetStatus.values.byName(name);
  }
}

class InternetServicesState extends Equatable {
  final InternetStatus internetStatus;

  const InternetServicesState({required this.internetStatus});

  //Initial state
  factory InternetServicesState.initial() {
    return const InternetServicesState(
      internetStatus: InternetStatus.initial,
    );
  }

  @override
  List<Object> get props => [internetStatus];

  @override
  bool get stringify => true;

  //Convert State Object to Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'internetStatus': internetStatus.toMap(),
    };
  }

  //Create State Object from Map
  factory InternetServicesState.fromMap(Map<String, dynamic> map) {
    return InternetServicesState(
      internetStatus: InternetStatus.fromMap(map['internetStatus'] as String),
    );
  }

  InternetServicesState copyWith({
    InternetStatus? internetStatus,
  }) {
    return InternetServicesState(
      internetStatus: internetStatus ?? this.internetStatus,
    );
  }
}
