import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Bloc/ImageUpload/image_upload_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
          lazy: true,
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
          lazy: true,
        ),
        BlocProvider<DogBloc>(
          create: (BuildContext context) => DogBloc(),
          lazy: true,
        ),
        BlocProvider<ImageUploadBloc>(
          create: (BuildContext context) => ImageUploadBloc(),
          lazy: true,
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 680),
        builder: (context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Dating App",
            routes: routes,
            initialRoute: "/",
          );
        },
      ),
    );
  }
}
