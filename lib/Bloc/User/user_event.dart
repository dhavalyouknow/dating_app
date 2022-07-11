part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UpdateUserEvent extends UserEvent {
  final User user;
  final Function(String) success;

  const UpdateUserEvent({
    required this.user,
    required this.success,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [user, success];
}
