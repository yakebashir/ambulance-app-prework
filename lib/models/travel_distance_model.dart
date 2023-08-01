// ignore_for_file: public_member_api_docs, sort_constructors_first
class TravelDistance {
  final String text;
  final int value;

  const TravelDistance({
    required this.text,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'value': value,
    };
  }

  factory TravelDistance.fromMap(Map<String, dynamic> map) {
    return TravelDistance(
      text: map['text'] as String,
      value: map['value'] as int,
    );
  }
}
