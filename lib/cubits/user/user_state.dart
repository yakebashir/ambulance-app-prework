// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

class UserState extends Equatable {
  final User user;
  final ErrorStatus errorStatus;
  final DataStatus dataStatus;
  const UserState({
    required this.user,
    required this.errorStatus,
    required this.dataStatus,
  });

  @override
  List<Object> get props => [user, errorStatus, dataStatus];

  factory UserState.initial() => UserState(
        user: User(),
        errorStatus: ErrorStatus.noError,
        dataStatus: DataStatus.initial,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'errorStatus': errorStatus.toMap(),
      'dataStatus': dataStatus.toMap(),
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      errorStatus: ErrorStatus.fromMap(map['errorStatus'] as String),
      dataStatus: DataStatus.fromMap(map['dataStatus'] as String),
    );
  }

  UserState copyWith({
    User? user,
    ErrorStatus? errorStatus,
    DataStatus? dataStatus,
  }) {
    return UserState(
      user: user ?? this.user,
      errorStatus: errorStatus ?? this.errorStatus,
      dataStatus: dataStatus ?? this.dataStatus,
    );
  }
}
