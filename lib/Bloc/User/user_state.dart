part of 'user_bloc.dart';

enum UserStatus {
  initial,
  success,
  failure,
  loading,
}

class UserState extends Equatable {
  final UserStatus status;
  User? user;

  UserState({
    required this.status,
    this.user,
  });

  UserState copyWith({
    UserStatus? status,
    User? user,
  }) {
    print(user);
    return UserState(status: status ?? this.status, user: user ?? this.user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, user];
}

class UserInitial extends UserState {
  UserInitial() : super(status: UserStatus.initial);
}
