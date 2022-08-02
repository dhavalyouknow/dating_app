import 'package:dating_app/Bloc/DogSwipe/dog_swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_state.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Dialog/UpgradeToPremium/upgrade_to_premium.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipable_stack/swipable_stack.dart';

mixin HomePageHandlers<T extends StatefulWidget> on State<T> {
  late SwipableStackController swipeController = SwipableStackController();
  bool showImageBig = false;
  bool onSwitchDog = false;
  User? user;
  int pageNo = 1;
  int limitNo = 10;

  void listenController() => setState(() async {
        if (BlocProvider.of<UserBloc>(context).state.user!.isPro == false) {
          await showDialog(
            context: context,
            builder: (context) {
              return const UpgradeToPremium();
            },
          );
        }
      });

  @override
  initState() {
    super.initState();
    swipeController = SwipableStackController()..addListener(listenController);
    BlocProvider.of<SwipeBloc>(context).add(
      GetSwipeList(pageNo: pageNo, limitNo: 10, onSuccess: (success) {}),
    );
    user = BlocProvider.of<UserBloc>(context).state.user;
  }

  @override
  void dispose() {
    super.dispose();
    swipeController
      ..removeListener(listenController)
      ..dispose();
  }

  onDogSwipe() {
    if (onSwitchDog == false) {
      onSwitchDog = true;
      BlocProvider.of<DogSwipeBloc>(context)
          .add(GetDogSwiperList(pageNo: 1, limitNo: 1));
    } else {
      onSwitchDog = false;
      BlocProvider.of<SwipeBloc>(context).add(
        GetSwipeList(pageNo: pageNo, limitNo: 10, onSuccess: (success) {}),
      );
    }
    setState(() {});
  }

  disLikePerson(SwipeState swipeState) {
    BlocProvider.of<SwipeBloc>(context).add(
      DisLikePerson(
        userId: user!.id.toString(),
        swipeUserId: swipeState.swipe[swipeController.currentIndex].id,
        onSuccess: (value) {
          swipeController.next(
            swipeDirection: SwipeDirection.left,
          );
        },
      ),
    );
  }

  disLikeDog(DogSwipeState dogSwipeState) {
    BlocProvider.of<DogSwipeBloc>(context).add(
      DisLikeDog(
        userId: user!.id.toString(),
        swipeUSerId: dogSwipeState.dogSwipes[swipeController.currentIndex].id!,
        onSuccess: () {
          swipeController.next(
            swipeDirection: SwipeDirection.left,
          );
        },
      ),
    );
  }

  likePerson(SwipeState swipeState) {
    BlocProvider.of<SwipeBloc>(context).add(
      LikePerson(
        userId: user!.id.toString(),
        swipeUserId: swipeState.swipe[swipeController.currentIndex].id,
        onSuccess: (value) {
          swipeController.next(
            swipeDirection: SwipeDirection.right,
          );
        },
      ),
    );
  }

  likeDog(DogSwipeState dogSwipeState) {
    BlocProvider.of<DogSwipeBloc>(context).add(
      LikeDog(
        userId: user!.id.toString(),
        swipeUSerId: dogSwipeState.dogSwipes[swipeController.currentIndex].id!,
        onSuccess: () {
          swipeController.next(
            swipeDirection: SwipeDirection.right,
          );
        },
      ),
    );
  }
}
