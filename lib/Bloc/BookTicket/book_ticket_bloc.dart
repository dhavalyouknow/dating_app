import 'dart:ffi';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_ticket_event.dart';
part 'book_ticket_state.dart';

class BookTicketBloc extends Bloc<BookTicketEvent, BookTicketState>
    with BaseHttpService {
  BookTicketBloc() : super(BookTicketInitial()) {
    on<BookTicketEvent>((event, emit) {});
    on<BookUserTicketEvent>(_onBookUserTicketEvent);
    on<UpdateUserTicket>(_onUpdateUserTicket);
  }
  Future<void> _onBookUserTicketEvent(
    BookUserTicketEvent event,
    Emitter<BookTicketState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BookTicketStatus.loading));
      var resp = await post(
        url: ApiEndPoints.bookTicket,
        body: {
          "seatCount": event.seatCount,
          "stripeTransaction": event.stripeTransaction,
          "eventId": event.eventId,
          "userId": event.userId,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.statusCode);
          print(resp.body);
          event.success();
          emit(state.copyWith(status: BookTicketStatus.success));
        } else {
          print(resp.statusCode);
          print(resp.body);
          emit(state.copyWith(status: BookTicketStatus.failure));
        }
      } else {
        print(resp);
        print(resp?.statusCode);
        emit(state.copyWith(status: BookTicketStatus.failure));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onUpdateUserTicket(
    UpdateUserTicket event,
    Emitter<BookTicketState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BookTicketStatus.loading));
      var resp = await patch(
        url: "${ApiEndPoints.bookTicket}/${event.eventId}",
        body: {
          "seatCount": event.seatCount,
          "stripeTransaction": event.stripeTransaction,
          "eventId": event.eventId,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.statusCode);
          print(resp.body);
          event.success();
          emit(state.copyWith(status: BookTicketStatus.success));
        } else {
          print(resp.statusCode);
          print(resp.body);
          emit(state.copyWith(status: BookTicketStatus.failure));
        }
      } else {
        print(resp);
        print(resp?.statusCode);
        emit(state.copyWith(status: BookTicketStatus.failure));
      }
    } catch (e) {
      print(e);
    }
  }
}
