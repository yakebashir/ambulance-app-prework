// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'error_handling_cubit.dart';

class ErrorHandlingState extends Equatable {
  final CustomException exception;

  const ErrorHandlingState({required this.exception});

  factory ErrorHandlingState.initial() {
    return ErrorHandlingState(exception: emptyException);
  }

  @override
  List<Object> get props => [exception];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exception': exception.toMap(),
    };
  }

  factory ErrorHandlingState.fromMap(Map<String, dynamic> map) {
    return ErrorHandlingState(
      exception:
          CustomException.fromMap(map['exception'] as Map<String, dynamic>),
    );
  }

  ErrorHandlingState copyWith({
    CustomException? exception,
  }) {
    return ErrorHandlingState(
      exception: exception ?? this.exception,
    );
  }
}
