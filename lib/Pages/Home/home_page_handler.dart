import 'package:dating_app/Bloc/DogSwipe/dog_swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipable_stack/swipable_stack.dart';

mixin HomePageHandlers<T extends StatefulWidget> on State<T> {
  late SwipableStackController swipeController = SwipableStackController();
  bool showImageBig = false;
  bool onSwitchDog = false;
  User? user;

  void _listenController() => setState(() {});

  @override
  initState() {
    super.initState();
    swipeController = SwipableStackController()..addListener(_listenController);
    BlocProvider.of<SwipeBloc>(context).add(
      GetSwipeList(),
    );

    user = BlocProvider.of<UserBloc>(context).state.user;

    //  BlocProvider.of<SwipeBloc>(context).add(DogSwipeList());
  }

  @override
  void dispose() {
    super.dispose();
    swipeController
      ..removeListener(_listenController)
      ..dispose();
  }

  onDogSwipe() {
    if (onSwitchDog == false) {
      onSwitchDog = true;
      BlocProvider.of<DogSwipeBloc>(context).add(GetDogSwiperList());
    } else {
      onSwitchDog = false;
      BlocProvider.of<SwipeBloc>(context).add(
        GetSwipeList(),
      );
    }
    setState(() {});
  }

  // disLikePerson() {
  //   print(user?.id);
  //   swipeController.next(
  //     swipeDirection: SwipeDirection.left,
  //   );
  //   swipeController.addListener(() {
  //     print('${swipeController.currentIndex}');
  //     print('1111');
  //   });
  //
  //   // BlocProvider.of<SwipeBloc>(context).add(DisLikePerson(swipeUserId: '',userId: ''));
  // }
}
