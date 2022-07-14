import 'package:dating_app/Bloc/Swipe/swipe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipable_stack/swipable_stack.dart';

mixin HomePageHandlers<T extends StatefulWidget> on State<T> {
  late SwipableStackController swipeController = SwipableStackController();

  void _listenController() => setState(() {});
  @override
  initState() {
    super.initState();
    swipeController = SwipableStackController()..addListener(_listenController);
    BlocProvider.of<SwipeBloc>(context).add(GetSwipeList());
  }

  @override
  void dispose() {
    super.dispose();
    swipeController
      ..removeListener(_listenController)
      ..dispose();
  }
}
