// ignore_for_file: public_member_api_docs, sort_constructors_first

class Driver {
  final String name;
  final String gender;
  final String? airtelNumber;
  final String? mtnNumber;

  //Constructor
  const Driver({
    required this.name,
    required this.gender,
    this.airtelNumber,
    this.mtnNumber,
  });

  //Method that returns a map from a Driver Object
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'airtelNumber': airtelNumber,
      'mtnNumber': mtnNumber,
    };
  }

  //Factory named constructor that makes Driver Object from a map
  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      name: map['name'] as String,
      gender: map['gender'] as String,
      airtelNumber:
          map['airtelNumber'] != null ? map['airtelNumber'] as String : null,
      mtnNumber: map['mtnNumber'] != null ? map['mtnNumber'] as String : null,
    );
  }
}
