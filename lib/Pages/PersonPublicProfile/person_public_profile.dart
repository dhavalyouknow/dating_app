import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/PersonPublicProfile/person_public_profile_dialog.dart';
import 'package:dating_app/Pages/PersonPublicProfile/person_public_profile_handler.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonPublicProfile extends StatefulWidget {
  static const routeName = '/PersonPublicProfile';
  const PersonPublicProfile({Key? key}) : super(key: key);

  @override
  State<PersonPublicProfile> createState() => _PersonPublicProfileState();
}

class _PersonPublicProfileState extends State<PersonPublicProfile>
    with PersonPublicHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        print(userState);
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
                        return const PersonEditPopup();
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
                onPressed: () {
                  Navigator.pushReplacementNamed(context, ('/MyPage'));
                },
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
              text: "${userState.user!.firstName} ${userState.user!.lastName}",
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
                          itemCount: userState.user!.squareProfileImage!.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl:
                                  userState.user!.squareProfileImage != null
                                      ? userState
                                          .user!.squareProfileImage![index].url
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

                            //   Container(
                            //   child: Image.network(
                            //     userState.user!.squareProfileImage![index].url
                            //         .toString(),
                            //     fit: BoxFit.cover,
                            //   ),
                            // );
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
                                text:
                                    "${userState.user!.firstName} ${userState.user!.lastName}",
                                color: AppStyles.whiteColor,
                                fontFamily: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                ).fontFamily,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: AppStyles.whiteColor,
                                  ),
                                  SizedBox(width: 5.w),
                                  AppText(
                                    text: userState.user!.city.toString(),
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
                              text: userState.user!.searchingFor
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
                          text: "${userState.user!.firstName}'s Dogs",
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                  .fontFamily,
                        ),
                        SizedBox(height: 20.h),
                        ...userState.user!.dog.map((e) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 70.h,
                                  width: 70.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1657895116418-b70a43670985?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
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
                                                  ? userState.user!
                                                      .circleProfileImage!.url
                                                      .toString()
                                                  : "",
                                              errorWidget:
                                                  (BuildContext context, url,
                                                      data) {
                                                return const ImageErrorWidget();
                                              },
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
                          );
                        }).toList(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
