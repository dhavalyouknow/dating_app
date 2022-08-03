import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/OtherPublicProfile/other_public_profile_handler.dart';
import 'package:dating_app/Pages/OtherPublicProfile/report_other.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherPublicProfile extends StatefulWidget {
  static const routeName = '/OtherPublicProfile';

  const OtherPublicProfile({Key? key}) : super(key: key);

  @override
  State<OtherPublicProfile> createState() => _OtherPublicProfileState();
}

class _OtherPublicProfileState extends State<OtherPublicProfile>
    with OtherPersonPublicHandlers {
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
                showDialog(
                  context: context,
                  builder: (context) {
                    return ReportOtherPopup(reportId: swipe!.id);
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
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppStyles.greyColor,
              size: 25.h,
            ),
          ),
        ),
        backgroundColor: AppStyles.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: "${swipe!.firstName} ${swipe!.lastName}",
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
        ),
      ),
      body: Container(
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
              SizedBox(
                height: 350.h,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: swipe?.squareProfileImage.length,
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: swipe!.squareProfileImage != null
                              ? swipe!.squareProfileImage[index].url.toString()
                              : "",
                          fit: BoxFit.cover,
                          errorWidget: (BuildContext context, url, data) {
                            return const ImageErrorWidget();
                          },
                          placeholder: (context, url) => const LoadingWidget(),
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
                            text: "${swipe!.firstName} ${swipe!.lastName}",
                            color: AppStyles.whiteColor,
                            fontFamily: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                            ).fontFamily,
                          ),
                          SizedBox(height: 5.h),
                          if (swipe!.city.isNotEmpty)
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppStyles.whiteColor,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 5.w),
                                AppText(
                                  text: swipe!.city.toString(),
                                  color: AppStyles.whiteColor,
                                ),
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
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
                        // AppText(
                        //   text: swipe!.searchingFor
                        //       .toString()
                        //       .replaceAll("[", "")
                        //       .replaceAll("]", ""),
                        //   color: AppStyles.greyColor,
                        //   size: 15.sp,
                        //   fontFamily:
                        //       GoogleFonts.raleway(fontWeight: FontWeight.w600)
                        //           .fontFamily,
                        // ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    AppText(
                      size: 18.sp,
                      text: "About",
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                    ),
                    SizedBox(height: 5.h),
                    AppText(
                      size: 13.sp,
                      text: "${swipe!.about} This is me",
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w500)
                              .fontFamily,
                    ),
                    SizedBox(height: 20.h),
                    AppText(
                      size: 18.sp,
                      text: "${swipe!.firstName}'s Dogs",
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                    ),
                    SizedBox(height: 13.h),
                    ...swipe!.dog!.map((e) {
                      return Row(
                        children: [
                          SizedBox(
                            height: 70.h,
                            width: 70.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: e.squareProfileImage!.isNotEmpty
                                    ? e.squareProfileImage!.first.url.toString()
                                    : "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const LoadingWidget(),
                                errorWidget: (BuildContext context, url, data) {
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
                                size: 16.sp,
                                text: '${e.dogName}',
                                fontFamily: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w600)
                                    .fontFamily,
                              ),
                              SizedBox(height: 5.h),
                              if (swipe!.city.isNotEmpty)
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                      color: AppStyles.skyBlueColor,
                                    ),
                                    AppText(
                                      size: 10.sp,
                                      text: '${swipe?.city}',
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
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            swipe?.circleProfileImage != null
                                                ? swipe!.circleProfileImage
                                                    .toString()
                                                : "",
                                        errorWidget:
                                            (BuildContext context, url, data) {
                                          return const ImageErrorWidget();
                                        },
                                        placeholder: (context, url) =>
                                            const LoadingWidget(),
                                        height: 18.h,
                                        width: 18.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  AppText(
                                    size: 14.sp,
                                    text:
                                        '${swipe?.firstName} ${swipe?.lastName}',
                                    fontFamily: GoogleFonts.raleway(
                                            fontWeight: FontWeight.w700)
                                        .fontFamily,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      );
                    }).toList(),
                    // AllDataFieldWidget(user: ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
