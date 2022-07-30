import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/EditEmail/enter_email.dart';
import 'package:dating_app/Pages/Intro/first_intro_page.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditEmail extends StatefulWidget {
  static const routeName = "/EditEmail";
  const EditEmail({Key? key}) : super(key: key);

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('88888888');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('fdsfretreferd');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    User? user = BlocProvider.of<UserBloc>(context).state.user;
    print('5555555555');
    print(user?.isEmailVerified);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffCEEFFF),
              Color(0xffB6E4FA),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/mail_icon.png"),
            AppText(
              size: 21.sp,
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
              text: "Almost There!",
            ),
            SizedBox(height: 20.h),
            AppText(
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
              textAlign: TextAlign.center,
              text:
                  "We just sent a confirmation link to\n${user!.email}\nCheck your email for a link to sign in.",
            ),
            SizedBox(height: 20.h),
            GradientBtn(
              borderRadius: 10.r,
              height: size.height / 14,
              txt: "Edit email address",
              onTap: () {
                Navigator.pushNamed(context, EditUserEmail.routeName);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            GradientBtn(
              borderRadius: 10.r,
              height: size.height / 14,
              txt: "Next",
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(
                  SessionRequest(
                    onSuccess: (user) {
                      print('=====');
                      if (user.isEmailVerified == true) {
                        Navigator.pushReplacementNamed(
                            context, '/ChoosePartner');
                      } else {
                        Fluttertoast.showToast(msg: 'Please verify your email');
                      }
                    },
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                var token = prefs.getString('auth_token');
                Future.delayed(const Duration(seconds: 0), () {
                  BlocProvider.of<UserBloc>(context).add(
                    ResendEmail(
                      headerToken: token!,
                      onSuccess: () {
                        Fluttertoast.showToast(
                            msg:
                                'Your reset email has been successfully sent.');
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          EditEmail.routeName,
                        );
                      },
                      onError: () {
                        setState(() {
                          isLoading = false;
                        });
                        Fluttertoast.showToast(
                            msg:
                                'This email address is already associated with another account. Please use a different email address.');
                      },
                    ),
                  );
                });
              },
              child: AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Resend Email",
              ),
            ),
            AppText(
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
              textAlign: TextAlign.center,
              text:
                  "Didn’t receive the link?\nMake sure to check your spam filter.",
            )
          ],
        ),
      ),
    );
  }
}
