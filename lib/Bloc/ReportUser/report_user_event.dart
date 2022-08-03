part of 'report_user_bloc.dart';

@immutable
abstract class ReportUserEvent extends Equatable {}

class ReportUserRequest extends ReportUserEvent {
  final String userId;
  final String reportBy;
  final String reason;
  final String message;
  final VoidCallback success;

  ReportUserRequest({
    required this.userId,
    required this.reportBy,
    required this.reason,
    required this.message,
    required this.success,
  });

  @override
  List<Object?> get props => [
        userId,
        reportBy,
        reason,
        message,
        success,
      ];
}
