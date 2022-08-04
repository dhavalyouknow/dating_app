import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/Event/event_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog.dart';
import 'package:dating_app/Pages/BottomBar/bottom_bar.dart';
import 'package:dating_app/Pages/DogPublicProfile/dog_public_profile.dart';
import 'package:dating_app/Pages/MyPage/my_page_handler.dart';
import 'package:dating_app/Pages/PersonPublicProfile/person_public_profile.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:dating_app/widget/showDogProfileWidget.dart';
import 'package:dating_app/widget/showProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyPage extends StatefulWidget {
  static const routeName = "/MyPage";

  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with MyPageHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        selectedItemPosition: 0,
      ),
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
        backgroundColor: AppStyles.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: AppLocalizations.of(context)!.myPage,
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
                    text: AppLocalizations.of(context)!.myProfile,
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
                    text: AppLocalizations.of(context)!.myDogs,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                  ),
                  SizedBox(height: 15.h),
                  ...userState.user!.dog!.map((e) {
                    return ShowDogProfileWidget(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DogPublicProfile.routeName,
                          arguments: e,
                        );
                      },
                      user: userState.user,
                      e: e,
                    );
                  }).toList(),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: size.width / 4,
                    child: GradientBtn(
                      borderRadius: 10.r,
                      height: size.height / 18,
                      txt: "Add Dog",
                      onTap: () {
                        Navigator.pushNamed(context, AddYourDog.routeName);
                      },
                    ),
                  ),
                  // BlocBuilder<EventBloc, EventState>(
                  //   builder: (context, evenStatus) {
                  //     print(evenStatus);
                  //     if (evenStatus.event != null) {
                  //       return Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: EdgeInsets.symmetric(vertical: 10.h),
                  //             child: AppText(
                  //               size: 18.sp,
                  //               text: AppLocalizations.of(context)!
                  //                   .upComingEvents,
                  //               fontFamily: GoogleFonts.raleway(
                  //                       fontWeight: FontWeight.bold)
                  //                   .fontFamily,
                  //             ),
                  //           ),
                  //           ...evenStatus.event!.map(
                  //             (e) {
                  //               return Row(
                  //                 children: [
                  //                   Stack(
                  //                     children: [
                  //                       Container(
                  //                         margin: EdgeInsets.symmetric(
                  //                             vertical: 5.h),
                  //                         height: 70.h,
                  //                         width: 70.w,
                  //                         child: ClipRRect(
                  //                           borderRadius:
                  //                               BorderRadius.circular(15.r),
                  //                           child: CachedNetworkImage(
                  //                             height: 100.h,
                  //                             imageUrl: e.eventPic!.first.url
                  //                                 .toString(),
                  //                             fit: BoxFit.cover,
                  //                             errorWidget:
                  //                                 (BuildContext context, url,
                  //                                     data) {
                  //                               return const ImageErrorWidget();
                  //                             },
                  //                             placeholder: (context, url) =>
                  //                                 const LoadingWidget(),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       Positioned(
                  //                         left: 12.w,
                  //                         top: 10.h,
                  //                         child: AppText(
                  //                           size: 24.sp,
                  //                           textAlign: TextAlign.center,
                  //                           text: DateFormat('dd\nMMMM').format(
                  //                             DateTime.parse("${e.eventDate}"),
                  //                           ),
                  //                           fontFamily: GoogleFonts.raleway(
                  //                                   fontWeight: FontWeight.w600)
                  //                               .fontFamily,
                  //                           color: AppStyles.whiteColor,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsets.only(left: 10.w),
                  //                     child: Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         AppText(
                  //                           size: 16.sp,
                  //                           text: e.title.toString(),
                  //                           fontFamily: GoogleFonts.raleway(
                  //                                   fontWeight: FontWeight.w600)
                  //                               .fontFamily,
                  //                         ),
                  //                         Container(
                  //                           padding: EdgeInsets.symmetric(
                  //                             horizontal: 5.w,
                  //                             vertical: 5.h,
                  //                           ),
                  //                           height: 30.h,
                  //                           decoration: BoxDecoration(
                  //                             color: AppStyles.primaryColor,
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10),
                  //                           ),
                  //                           child: Row(
                  //                             children: [
                  //                               const Icon(
                  //                                   Icons.person_outline),
                  //                               AppText(
                  //                                 size: 16.sp,
                  //                                 text:
                  //                                     "${e.bookedSeat}/${e.totalCapacity} people",
                  //                                 fontFamily:
                  //                                     GoogleFonts.raleway(
                  //                                             fontWeight:
                  //                                                 FontWeight
                  //                                                     .w600)
                  //                                         .fontFamily,
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ],
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       );
                  //     } else {
                  //       return const LoadingWidget();
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
