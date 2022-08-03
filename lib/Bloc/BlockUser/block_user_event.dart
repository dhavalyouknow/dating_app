part of 'block_user_bloc.dart';

abstract class BlockUserEvent extends Equatable {}

class BLockUserRequest extends BlockUserEvent {
  final String myUserId;
  final String reportUserId;
  final VoidCallback success;

  BLockUserRequest({
    required this.myUserId,
    required this.reportUserId,
    required this.success,
  });

  @override
  List<Object?> get props => [
        myUserId,
        reportUserId,
        success,
      ];
}
