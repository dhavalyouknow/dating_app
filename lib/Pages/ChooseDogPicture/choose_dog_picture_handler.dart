import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin DogPictureHandlers<T extends StatefulWidget> on State<T> {
  // Map<String, dynamic>? dataList;
  // User? user;

  // @override
  // initState() {
  //   super.initState();
  //   user = BlocProvider.of<UserBloc>(context).state.user as User;
  //   print('user ==> $user');
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (ModalRoute.of(context)!.settings.arguments != null) {
  //     print(ModalRoute.of(context)!.settings.arguments);
  //     // dataList =
  //     //     (ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?);
  //     print('dateList ==> $dataList');
  //   } else {
  //     return;
  //   }
  // }
  //
  // onSubmit() {
  //   print(dataList);
  //   // BlocProvider.of<DogBloc>(context).add(
  //   //   AddDogEvent(
  //   //     dogName: dataList["dogName"],
  //   //     gender: dataList["selectedDogGender"],
  //   //     size: dataList["selectedDogSize"],
  //   //     lookingFor: dataList["myDogLookingFor"],
  //   //     id: dataList["id"],
  //   //     onSuccess: (dog) {
  //   //       print('DOG -> $dog');
  //   //       user = user?.copyWith(dog: [...?user?.dog, dog]);
  //   //       BlocProvider.of<UserBloc>(context).add(SetUser(user: user!));
  //   //       print(user?.dog!.length);
  //   //     },
  //   //   ),
  //   // );
  // }
}
