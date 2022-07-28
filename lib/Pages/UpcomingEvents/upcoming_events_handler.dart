import 'package:dating_app/Bloc/Event/event_bloc.dart';
import 'package:dating_app/Model/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin UpComingEventsHandlers<T extends StatefulWidget> on State<T> {
  Event? event;
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
}
