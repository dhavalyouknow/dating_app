import 'dart:convert';

import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> with BaseHttpService {
  EventBloc() : super(EventInitial()) {
    on<EventEvent>((event, emit) {});
    on<GetEventList>(_onGetEventList);
    on<SearchEvent>(_onSearchEvent);
  }
  _onGetEventList(GetEventList event, Emitter<EventState> emit) async {
    try {
      emit(state.copyWith(status: EventStatus.loading));
      var resp = await get(url: ApiEndPoints.upComingEvent);
      if (resp != null) {
        if (resp.statusCode == 200) {
          print("====================");
          print(resp.statusCode);
          print(resp.body);
          List<Event> events = [];
          dynamic result = jsonDecode(resp.body);
          for (dynamic json in result) {
            events.add(Event.fromJson(json));
          }
          print('33333');
          print(resp.body);
          print(resp.statusCode);
          emit(state.copyWith(status: EventStatus.success, event: events));
        } else {
          print(resp.body);
          print(resp.statusCode);
          emit(state.copyWith(status: EventStatus.failure));
        }
      } else {
        print(resp?.statusCode);
        emit(state.copyWith(status: EventStatus.failure));
      }
    } catch (e) {
      print(e);
      print('--get events---');
    }
  }

  _onSearchEvent(SearchEvent event, Emitter<EventState> emit) async {
    try {
      var resp = await get(
        url: "${ApiEndPoints.searchEvent}${event.searchText}",
      );
      if (resp != null) {
        emit(state.copyWith(status: EventStatus.loading));
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          dynamic result = jsonDecode(resp.body);
          List<Event> searchEvents = [];
          for (dynamic data in result) {
            searchEvents.add(Event.fromJson(data));
          }
          print(searchEvents.length);
          event.onSuccess(searchEvents);
          emit(
              state.copyWith(event: searchEvents, status: EventStatus.success));
        } else {
          print(resp.body);
          print(resp.statusCode);
          emit(state.copyWith(status: EventStatus.failure));
        }
      } else {
        print(resp?.statusCode);
        emit(state.copyWith(status: EventStatus.failure));
      }
    } catch (e) {
      print(e);
      print('--search events---');
    }
  }
}
