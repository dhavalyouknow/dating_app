import 'package:dating_app/Bloc/BookTicket/book_ticket_bloc.dart';
import 'package:dating_app/Bloc/Event/event_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin UpComingEventsHandlers<T extends StatefulWidget> on State<T> {
  Event? event;
  TextEditingController searchController = TextEditingController();
  List<Event> searchEvents = [];
  bool isNotShowList = false;
  bool showWhenOpen = false;

  @override
  initState() {
    super.initState();
    BlocProvider.of<EventBloc>(context).add(GetEventList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    event = ModalRoute.of(context)!.settings.arguments as Event?;
    super.didChangeDependencies();
  }

  onAttendEvent(int seatCount) {
    BlocProvider.of<BookTicketBloc>(context).add(
      BookUserTicketEvent(
        seatCount: seatCount,
        stripeTransaction: "stripeTransaction",
        eventId: event!.id.toString(),
        userId: BlocProvider.of<UserBloc>(context).state.user!.id.toString(),
        success: () {
          if (event!.bookedSeat == event!.totalCapacity) {
            Fluttertoast.showToast(msg: 'No Tickets Are Available');
          } else {
            Fluttertoast.showToast(msg: 'Your Ticket Booked Successfully');
          }
          Navigator.pop(context);
        },
      ),
    );
  }

  onUpdateEvent() {
    BlocProvider.of<BookTicketBloc>(context).add(
      UpdateUserTicket(
        seatCount: 5,
        stripeTransaction: "stripeTransaction",
        eventId: event!.id.toString(),
        userId: BlocProvider.of<UserBloc>(context)
            .state
            .user!
            .ticketId!
            .first
            .toString(),
        success: () {
          Fluttertoast.showToast(msg: 'Your Ticket Updated Successfully');
        },
      ),
    );
  }

  onCancelEvent() {}
}
