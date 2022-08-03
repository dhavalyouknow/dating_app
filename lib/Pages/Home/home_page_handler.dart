import 'package:dating_app/Bloc/DogSwipe/dog_swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_state.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/dogSwipe.dart';
import 'package:dating_app/Model/swipe.dart';
import 'package:dating_app/Dialog/UpgradeToPremium/upgrade_to_premium.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipable_stack/swipable_stack.dart';

mixin HomePageHandlers<T extends StatefulWidget> on State<T> {
  late SwipableStackController swipeController = SwipableStackController();
  late SwipableStackController dogSwipeController = SwipableStackController();
  bool showImageBig = false;
  bool onSwitchDog = false;
  User? user;
  int pageNo = 1;
  int dogPageNo = 1;
  List<Swipe> swipe = [];
  List<DogSwipe> dogSwipe = [];

  //for user swipe
  void listenController() => setState(
        () async {
          if (BlocProvider.of<UserBloc>(context).state.user!.isPro == false) {
            await showDialog(
              context: context,
              builder: (context) {
                return const UpgradeToPremium();
              },
            );
          }
        },
      );

  @override
  initState() {
    super.initState();
    user = BlocProvider.of<UserBloc>(context).state.user;

    //load swipe user data first time
    BlocProvider.of<SwipeBloc>(context).add(
      GetSwipeList(
          pageNo: pageNo,
          limitNo: 10,
          onSuccess: (listOfSwipes) {
            swipe.addAll(listOfSwipes);
          }),
    );

    //listen user swipe
    swipeController = SwipableStackController()
      ..addListener(() {
        //if length small than currentIndex new data are added in list
        if (swipeController.currentIndex >= swipe.length && !onSwitchDog) {
          BlocProvider.of<SwipeBloc>(context).add(
            GetSwipeList(
              pageNo: pageNo,
              limitNo: 10,
              onSuccess: (listOfSwipes) {
                swipe.addAll(listOfSwipes);
              },
            ),
          );
        } else {}
      });

    //listen dog swipe
    dogSwipeController = SwipableStackController()
      ..addListener(() {
        //if length small than currentIndex new data are added in list
        if (dogSwipeController.currentIndex >= dogSwipe.length && onSwitchDog) {
          BlocProvider.of<DogSwipeBloc>(context).add(
            GetDogSwiperList(
              pageNo: dogPageNo,
              limitNo: 10,
              onSuccess: (listOfDogs) {
                dogSwipe.addAll(listOfDogs);
              },
            ),
          );
        }
      });
    setState(() {});
  }

  Future<void> dogListenController() async {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    swipeController
      ..removeListener(listenController)
      ..dispose();
    dogSwipeController
      ..removeListener(dogListenController)
      ..dispose();
  }

  //swap among person and dog in swipe
  onDogSwipe() {
    if (onSwitchDog == false) {
      onSwitchDog = true;
      BlocProvider.of<DogSwipeBloc>(context).add(
        GetDogSwiperList(
          pageNo: dogPageNo,
          limitNo: 10,
          onSuccess: (listOfDogs) {
            if (dogSwipe.isEmpty) {
              dogSwipe.addAll(listOfDogs);
            }
          },
        ),
      );
    } else {
      onSwitchDog = false;
      BlocProvider.of<SwipeBloc>(context).add(
        GetSwipeList(
          pageNo: pageNo,
          limitNo: 10,
          onSuccess: (listOfSwipes) {
            if (swipe.isEmpty) {
              swipe.addAll(listOfSwipes);
            }
          },
        ),
      );
    }
    setState(() {});
  }

//dislike user
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

  //dislike dog
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

  //like user
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

  //like dog
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
