// ignore_for_file: public_member_api_docs, sort_constructors_first
class TravelDuration {
  final String text;
  final int value;

  const TravelDuration({
    required this.text,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'value': value,
    };
  }

  factory TravelDuration.fromMap(Map<String, dynamic> map) {
    return TravelDuration(
      text: map['text'] as String,
      value: map['value'] as int,
    );
  }
}
