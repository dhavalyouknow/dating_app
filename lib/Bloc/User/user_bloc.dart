import 'package:bloc/bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with BaseHttpService {
  UserBloc() : super(const UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<UpdateUserEvent>(_onUpdateUserEvent);
  }

  _onUpdateUserEvent(UpdateUserEvent event, Emitter<UserState> emit) async {
    try {
      var resp = await patch(
          url: '${ApiEndPoints.updateUser}${event.user.id}', body: {});
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
}
