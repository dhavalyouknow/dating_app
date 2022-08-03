// ignore_for_file: must_be_immutable

part of 'book_ticket_bloc.dart';

enum BookTicketStatus {
  initial,
  success,
  failure,
  loading,
}

@immutable
class BookTicketState extends Equatable {
  final BookTicketStatus status;
  User? user;

  BookTicketState({
    required this.status,
    this.user,
  });

  BookTicketState copyWith({
    BookTicketStatus? status,
    User? user,
  }) {
    return BookTicketState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, user];
}

class BookTicketInitial extends BookTicketState {
  BookTicketInitial() : super(status: BookTicketStatus.initial);
}
