import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/DogPublicProfile/dog_public_profile_dialog.dart';
import 'package:dating_app/Pages/DogPublicProfile/dog_public_profile_handler.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DogPublicProfile extends StatefulWidget {
  static const routeName = "/DogPublicProfile";

  const DogPublicProfile({Key? key}) : super(key: key);

  @override
  State<DogPublicProfile> createState() => _DogPublicProfileState();
}

class _DogPublicProfileState extends State<DogPublicProfile>
    with DogPublicHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return DogEditPopup(dog: dog);
                  },
                );
              },
              icon: Icon(
                FontAwesomeIcons.ellipsisVertical,
                size: 25.h,
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
          text: "${dog!.dogName}",
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return Container(
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
                children: [
                  SizedBox(
                    height: 350.h,
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: dog!.squareProfileImage!.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: dog?.squareProfileImage != null
                                  ? dog!.squareProfileImage!.first.url
                                      .toString()
                                  : "",
                              fit: BoxFit.cover,
                              errorWidget: (BuildContext context, url, data) {
                                return const ImageErrorWidget();
                              },
                              placeholder: (context, url) => Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: Colors.grey.withOpacity(0.1),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppStyles.textColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          left: 25.w,
                          bottom: 25.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                size: 20.sp,
                                text: dog!.dogName.toString(),
                                color: AppStyles.whiteColor,
                                fontFamily: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                ).fontFamily,
                              ),
                              // Row(
                              //   children: [
                              //     const Icon(
                              //       Icons.location_on_outlined,
                              //       color: AppStyles.whiteColor,
                              //     ),
                              //     SizedBox(width: 5.w),
                              //     AppText(
                              //       text: userState.user!.city.toString(),
                              //       color: AppStyles.whiteColor,
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              color: AppStyles.pinkColor,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            AppText(
                              text: dog!.lookingFor
                                  .toString()
                                  .replaceAll("[", "")
                                  .replaceAll("]", ""),
                              color: AppStyles.greyColor,
                              size: 15.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600)
                                  .fontFamily,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        AppText(
                          size: 21.sp,
                          text: "About",
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                  .fontFamily,
                        ),
                        SizedBox(height: 5.h),
                        AppText(
                          size: 15.sp,
                          text: userState.user!.aboutSelf.toString(),
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.w500)
                                  .fontFamily,
                        ),
                        SizedBox(height: 20.h),
                        AppText(
                          size: 21.sp,
                          text: "${dog!.dogName}'s Owner",
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                  .fontFamily,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      userState.user?.squareProfileImage != null
                                          ? userState.user!.squareProfileImage!
                                              .first.url
                                              .toString()
                                          : "",
                                  fit: BoxFit.cover,
                                  errorWidget:
                                      (BuildContext context, url, data) {
                                    return const ImageErrorWidget();
                                  },
                                  placeholder: (context, url) => Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    color: Colors.grey.withOpacity(0.1),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: AppStyles.textColor,
                                      ),
                                    ),
                                  ),
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
                                    fontWeight: FontWeight.w600,
                                  ).fontFamily,
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
                                            colors:
                                                AppStyles.myPageGradientColor,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(3.0),
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                e.circleProfileImage != null
                                                    ? e.circleProfileImage!.url
                                                        .toString()
                                                    : "",
                                            errorWidget: (BuildContext context,
                                                url, data) {
                                              return const ImageErrorWidget();
                                            },
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
                                      text:
                                          "${userState.user?.dog.length} Dogs",
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
                      ],
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
