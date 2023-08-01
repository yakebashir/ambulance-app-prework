// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ambulance/constants.dart';

class CustomException implements Exception {
  final int errorCode;
  final String title;
  final String message;
  final ErrorOrigins errorOrigin;

  CustomException({
    required this.errorCode,
    required this.title,
    required this.message,
    required this.errorOrigin,
  });

  @override
  String toString() {
    return 'CustomException(errorCode: $errorCode, title: $title, message: $message, errorOrigin: $errorOrigin)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'errorCode': errorCode,
      'title': title,
      'message': message,
      'errorOrigin': errorOrigin.toMap(),
    };
  }

  factory CustomException.fromMap(Map<String, dynamic> map) {
    return CustomException(
      errorCode: map['errorCode'] as int,
      title: map['title'] as String,
      message: map['message'] as String,
      errorOrigin: ErrorOrigins.fromMap(map['errorOrigin'] as String),
    );
  }

  CustomException copyWith({
    int? errorCode,
    String? title,
    String? message,
    ErrorOrigins? errorOrigin,
  }) {
    return CustomException(
      errorCode: errorCode ?? this.errorCode,
      title: title ?? this.title,
      message: message ?? this.message,
      errorOrigin: errorOrigin ?? this.errorOrigin,
    );
  }
}
