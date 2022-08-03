part of 'book_ticket_bloc.dart';

abstract class BookTicketEvent extends Equatable {}

class BookUserTicketEvent extends BookTicketEvent {
  final Int seatCount;
  final String stripeTransaction;
  final String eventId;
  final String userId;
  final VoidCallback success;

  BookUserTicketEvent({
    required this.seatCount,
    required this.stripeTransaction,
    required this.eventId,
    required this.userId,
    required this.success,
  });

  @override
  List<Object?> get props => [
        seatCount,
        stripeTransaction,
        eventId,
        userId,
        success,
      ];
}

class UpdateUserTicket extends BookTicketEvent {
  final Int seatCount;
  final String stripeTransaction;
  final String eventId;
  final String userId;
  final VoidCallback success;

  UpdateUserTicket({
    required this.seatCount,
    required this.stripeTransaction,
    required this.eventId,
    required this.userId,
    required this.success,
  });

  @override
  List<Object?> get props => [
        seatCount,
        stripeTransaction,
        eventId,
        userId,
        success,
      ];
}
