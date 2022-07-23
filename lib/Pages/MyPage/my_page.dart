import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/DogPublicProfile/dog_public_profile.dart';
import 'package:dating_app/Pages/MyPage/my_page_handler.dart';
import 'package:dating_app/Pages/PersonPublicProfile/person_public_profile.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:dating_app/widget/showDogProfileWidget.dart';
import 'package:dating_app/widget/showProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with MyPageHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Settings');
              },
              icon: Icon(
                size: 30.h,
                Icons.settings,
                color: AppStyles.greyColor,
              ),
            ),
          ),
        ],
        backgroundColor: AppStyles.trasnparentColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: "My Page",
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          if (userState.user == null) {
            BlocProvider.of<AuthBloc>(context).add(
              SessionRequest(
                onSuccess: (user) {
                  BlocProvider.of<UserBloc>(context).add(
                    SetUser(user: user),
                  );
                  userState.user = user;
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
            );
            return const LoadingWidget();
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppStyles.forgotPassGradientColor,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  AppText(
                    size: 18.sp,
                    text: "My Profile",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                  ),
                  SizedBox(height: 15.h),
                  ShowProfileWidget(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PersonPublicProfile.routeName,
                      );
                    },
                    user: userState.user,
                  ),
                  SizedBox(height: 20.h),
                  AppText(
                    size: 18.sp,
                    text: "My Dogs",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                  ),
                  SizedBox(height: 15.h),
                  ...userState.user!.dog.map((e) {
                    return ShowDogProfileWidget(
                      onTap: () {
                        Navigator.pushNamed(context, DogPublicProfile.routeName,
                            arguments: e);
                      },
                      user: userState.user,
                      e: e,
                    );
                  }).toList(),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: size.width / 4,
                    child: GradientBtn(
                      height: size.height / 18,
                      txt: "Add Dog",
                      onTap: () {
                        Navigator.pushNamed(context, '/AddYourDog');
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
