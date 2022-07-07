import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
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
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 680),
        builder: (context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Real Estate",
            routes: routes,
            initialRoute: "/CreateAccount",
          );
        },
      ),
    );
  }
}
