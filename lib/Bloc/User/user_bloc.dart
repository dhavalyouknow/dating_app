import 'package:bloc/bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with BaseHttpService {
  UserBloc() : super(const UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<UpdateUserEvent>(_onUpdateUserEvent);
    on<SetUser>(_onSetUser);
  }

  _onUpdateUserEvent(UpdateUserEvent event, Emitter<UserState> emit) async {
    try {
      print('object');
      Map<String, dynamic> payload = event.user.toJson();
      payload.removeWhere((key, value) =>
          value == null || key == "_id" || key == "email" || key == "userType");
      var resp = await patch(
          url: '${ApiEndPoints.updateUser}${event.user.id}', body: payload);
      print('payload ===> $payload');
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          event.success('success');
        } else {
          print(resp.body);
          print(resp.statusCode);
        }
      } else {}
    } catch (e) {
      print(e);
      print('update-user-----');
    }
  }

  _onSetUser(SetUser event, Emitter<UserState> emit) async {}
}
