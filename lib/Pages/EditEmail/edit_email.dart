import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/EditEmail/enter_email.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditEmail extends StatefulWidget {
  static const routeName = "/EditEmail";
  const EditEmail({Key? key}) : super(key: key);

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    User? user = BlocProvider.of<UserBloc>(context).state.user;

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
            Image.asset(
              "assets/mail.png",
              width: 200.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            AppText(
              size: 21.sp,
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
              text: AppLocalizations.of(context)!.almostthere,
            ),
            SizedBox(height: 15.h),
            AppText(
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
              textAlign: TextAlign.center,
              text:
                  "${AppLocalizations.of(context)!.wejustsendaconfirmationlinktomail}\n${user!.email}\n${AppLocalizations.of(context)!.checkemail}",
            ),
            SizedBox(height: 20.h),
            GradientBtn(
              borderRadius: 10.r,
              height: size.height / 14,
              txt: AppLocalizations.of(context)!.editemailaddress,
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
              txt: AppLocalizations.of(context)!.clickhereafterverifyemail,
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                BlocProvider.of<AuthBloc>(context).add(
                  SessionRequest(
                    onSuccess: (user) {
                      if (user.isEmailVerified == true) {
                        Navigator.pushReplacementNamed(
                            context, '/ChoosePartner');
                      } else {
                        Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!
                              .pleaseverifyyouremail,
                          timeInSecForIosWeb: 5,
                        );
                      }
                      setState(() {
                        isLoading = false;
                      });
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
                          msg: AppLocalizations.of(context)!
                              .yourresetemailhasbeensuccessfullysent,
                          timeInSecForIosWeb: 5,
                        );
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
                          msg: AppLocalizations.of(context)!
                              .thisemailaddressisalreadyassociatedwithanotheraccountpleaseuseadifferentemailaddress,
                          timeInSecForIosWeb: 5,
                        );
                      },
                    ),
                  );
                });
              },
              child: AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: AppLocalizations.of(context)!.sendemail,
              ),
            ),
            AppText(
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
              textAlign: TextAlign.center,
              text:
                  "${AppLocalizations.of(context)!.didntreceivethelink}\n${AppLocalizations.of(context)!.makesuretocheckyourspamfilter}",
            )
          ],
        ),
      ),
    );
  }
}
