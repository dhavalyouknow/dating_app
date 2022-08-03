import 'package:dating_app/Bloc/BlockUser/block_user_bloc.dart';
import 'package:dating_app/Bloc/ReportUser/report_user_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/swipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin OtherPersonPublicHandlers<T extends StatefulWidget> on State<T> {
  Swipe? swipe;
  @override
  void didChangeDependencies() {
    swipe = ModalRoute.of(context)!.settings.arguments as Swipe;

    super.didChangeDependencies();
  }

  onReportUser(String userId) {
    BlocProvider.of<ReportUserBloc>(context).add(
      ReportUserRequest(
        userId: userId,
        reportBy: "${BlocProvider.of<UserBloc>(context).state.user!.id}",
        reason: "hello",
        message: "message",
        success: () {
          Fluttertoast.showToast(msg: 'User Reported Successfully');
        },
      ),
    );
  }

  onBlockUser(String userId) {
    BlocProvider.of<BlockUserBloc>(context).add(
      BLockUserRequest(
        myUserId: "${BlocProvider.of<UserBloc>(context).state.user!.id}",
        reportUserId: userId,
        success: () {
          Fluttertoast.showToast(msg: 'User Blocked Successfully');
        },
      ),
    );
  }
}
