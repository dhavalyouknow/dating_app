import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/DogPublicProfile/dog_public_profile.dart';
import 'package:dating_app/Pages/MyPage/my_page_handler.dart';
import 'package:dating_app/Pages/PersonPublicProfile/person_public_profile.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPage extends StatefulWidget {
  static const routeName ="/MyPage";
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PersonPublicProfile.routeName,
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 80.h,
                          width: 80.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl:
                                  userState.user?.squareProfileImage != null
                                      ? userState
                                          .user!.squareProfileImage!.first.url
                                          .toString()
                                      : "",
                              errorWidget: (BuildContext context, url, data) {
                                return const ImageErrorWidget();
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              size: 18.sp,
                              text:
                                  "${userState.user?.firstName} ${userState.user?.lastName}",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600)
                                  .fontFamily,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 16,
                                  color: AppStyles.skyBlueColor,
                                ),
                                Text(
                                  '${userState.user?.city}',
                                  style: TextStyle(fontSize: 10.sp),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                ...userState.user!.dog.map((e) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: AppStyles.myPageGradientColor,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: e.circleProfileImage != null
                                            ? e.circleProfileImage!.url
                                                .toString()
                                            : "",
                                        errorWidget:
                                            (BuildContext context, url, data) {
                                          return const ImageErrorWidget();
                                        },
                                        fit: BoxFit.cover,
                                        height: 28.h,
                                        width: 28.h,
                                      ),
                                    ),
                                  );

                                  ///don't remove
                                  // return Row(
                                  //   children: [
                                  //     SizedBox(
                                  //       width: size.width / 7,
                                  //       child: Stack(
                                  //         children: [
                                  //           // Positioned(
                                  //           //   left: 15.w,
                                  //           //   child: Container(
                                  //           //     decoration: BoxDecoration(
                                  //           //       shape: BoxShape.circle,
                                  //           //       border: Border.all(
                                  //           //         width: 2,
                                  //           //         color: AppStyles.greyColor,
                                  //           //       ),
                                  //           //     ),
                                  //           //     child: CircleAvatar(
                                  //           //       radius: 12.r,
                                  //           //       backgroundImage: const AssetImage(
                                  //           //         "assets/intro/Intro3Background.png",
                                  //           //       ),
                                  //           //     ),
                                  //           //   ),
                                  //           // ),
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //               shape: BoxShape.circle,
                                  //               gradient: LinearGradient(
                                  //                 colors: AppStyles
                                  //                     .myPageGradientColor,
                                  //               ),
                                  //             ),
                                  //             padding: const EdgeInsets.all(3.0),
                                  //             child: ClipOval(
                                  //               child: CachedNetworkImage(
                                  //                 imageUrl:
                                  //                     e.circleProfileImage != null
                                  //                         ? e.circleProfileImage!
                                  //                             .url
                                  //                             .toString()
                                  //                         : "",
                                  //                 height: 28.h,
                                  //                 width: 28.h,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     SizedBox(width: 5.w),
                                  //     AppText(
                                  //       size: 14.sp,
                                  //       text:
                                  //           "${userState.user?.dog?.length} Dogs",
                                  //       fontFamily: GoogleFonts.raleway(
                                  //               fontWeight: FontWeight.w700)
                                  //           .fontFamily,
                                  //     )
                                  //   ],
                                  // );
                                }).toList(),
                                SizedBox(width: 5.w),
                                AppText(
                                  size: 14.sp,
                                  text: "${userState.user?.dog.length} Dogs",
                                  fontFamily: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w700)
                                      .fontFamily,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, DogPublicProfile.routeName,
                              arguments: e);
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              height: 70.h,
                              width: 70.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: e.squareProfileImage!.isNotEmpty
                                      ? e.squareProfileImage!.first.url
                                          .toString()
                                      : "",
                                  fit: BoxFit.cover,
                                  errorWidget:
                                      (BuildContext context, url, data) {
                                    return const ImageErrorWidget();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  size: 18.sp,
                                  text: '${e.dogName}',
                                  fontFamily: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w600)
                                      .fontFamily,
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                      color: AppStyles.skyBlueColor,
                                    ),
                                    AppText(
                                      size: 10.sp,
                                      text: '${userState.user?.city}',
                                      fontFamily:
                                          GoogleFonts.raleway().fontFamily,
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppStyles.skyBlueColor,
                                      ),
                                      padding: const EdgeInsets.all(3.0),
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: userState.user
                                                      ?.circleProfileImage !=
                                                  null
                                              ? userState
                                                  .user!.circleProfileImage!.url
                                                  .toString()
                                              : "",
                                          errorWidget: (BuildContext context,
                                              url, data) {
                                            return const ImageErrorWidget();
                                          },
                                          fit: BoxFit.cover,
                                          height: 18.h,
                                          width: 18.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    AppText(
                                      size: 14.sp,
                                      text:
                                          '${userState.user?.firstName} ${userState.user?.lastName}',
                                      fontFamily: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w700)
                                          .fontFamily,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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
