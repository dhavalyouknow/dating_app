import 'package:dating_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 680),
      builder: (context, widget) {
        return MaterialApp(
           debugShowCheckedModeBanner: false,
        title: "Real EState",
        routes: routes,
        initialRoute: "/Matching",
        );
      },
    );
  }
}
