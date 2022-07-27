import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/ChangePassword/change_password_bloc.dart';
import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Bloc/ForgotPassword/forgot_password_bloc.dart';
import 'package:dating_app/Bloc/ImageUpload/image_upload_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Pages/Login/login_page.dart';
import 'package:dating_app/Pages/MyPage/my_page.dart';
import 'package:dating_app/firebase_options.dart';
import 'package:dating_app/l10n/l10n.dart';
import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:dating_app/routes.dart';
import 'package:dating_app/widget/spalsh.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///add release key when app live for facebook login
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('auth_token');
  print('token ===> $token');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MyApp(
      token: token,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, required this.token}) : super(key: key);

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
        BlocProvider<SwipeBloc>(
          create: (BuildContext context) => SwipeBloc(),
          lazy: true,
        ),
        BlocProvider<ChangePasswordBloc>(
          create: (BuildContext context) => ChangePasswordBloc(),
          lazy: true,
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (BuildContext context) => ForgotPasswordBloc(),
          lazy: true,
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 680),
        builder: (context, widget) {
          return ChangeNotifierProvider(
            create: (context) => LocalProvider(),
            builder: (context, child) {
              final provider = Provider.of<LocalProvider>(context);
              print(provider.locale);
              return MaterialApp(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: L10n.all,
                locale: provider.locale,
                debugShowCheckedModeBanner: false,
                title: "Dating App",
                routes: routes,
                initialRoute: SpalshScreen.routeName,
              );
            },
          );
        },
      ),
    );
  }
}
