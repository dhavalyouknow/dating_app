// ignore_for_file: must_be_immutable

part of 'report_user_bloc.dart';

enum ReportUserStatus {
  initial,
  success,
  failure,
  loading,
}

@immutable
class ReportUserState extends Equatable {
  final ReportUserStatus status;
  User? user;

  ReportUserState({
    required this.status,
    this.user,
  });

  ReportUserState copyWith({
    ReportUserStatus? status,
    User? user,
  }) {
    print(user);
    return ReportUserState(
        status: status ?? this.status, user: user ?? this.user);
  }

  @override
  List<Object?> get props => [status, user];
}

class ReportUserInitial extends ReportUserState {
  ReportUserInitial() : super(status: ReportUserStatus.initial);
}
