// ignore_for_file: must_be_immutable

part of 'block_user_bloc.dart';

enum BlockUserStatus {
  initial,
  success,
  failure,
  loading,
}

class BlockUserState extends Equatable {
  final BlockUserStatus status;
  User? user;

  BlockUserState({
    required this.status,
    this.user,
  });

  BlockUserState copyWith({
    BlockUserStatus? status,
    User? user,
  }) {
    return BlockUserState(
        status: status ?? this.status, user: user ?? this.user);
  }

  @override
  List<Object?> get props => [status, user];
}

class BlockUserInitial extends BlockUserState {
  BlockUserInitial() : super(status: BlockUserStatus.initial);
}
