// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

class UserState extends Equatable {
  final User user;
  final DataStatus dataStatus;
  final CustomException exception;

  factory UserState.initial() {
    return UserState(
      user: User(),
      dataStatus: DataStatus.initial,
      exception: emptyException,
    );
  }
  
  const UserState({
    required this.user,
    required this.dataStatus,
    required this.exception,
  });
  
  @override
  List<Object?> get props => [user, dataStatus, exception];
  

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'dataStatus': dataStatus.toMap(),
      'exception': exception.toMap(),
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      dataStatus: DataStatus.fromMap(map['dataStatus'] as String),
      exception:
          CustomException.fromMap(map['exception'] as Map<String, dynamic>),
    );
  }

  UserState copyWith({
    User? user,
    DataStatus? dataStatus,
    CustomException? exception,
  }) {
    return UserState(
      user: user ?? this.user,
      dataStatus: dataStatus ?? this.dataStatus,
      exception: exception ?? this.exception,
    );
  }
}
