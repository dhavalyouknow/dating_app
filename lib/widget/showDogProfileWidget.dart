import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDogProfileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Dog e;
  final User? user;

  const ShowDogProfileWidget(
      {Key? key, required this.onTap, required this.e, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
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
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w600)
                      .fontFamily,
                ),
                SizedBox(height: 5.h),
                if (user!.city!.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppStyles.skyBlueColor,
                      ),
                      AppText(
                        size: 10.sp,
                        text: '${user?.city}',
                        fontFamily: GoogleFonts.raleway().fontFamily,
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
                          imageUrl: user?.circleProfileImage != null
                              ? user!.circleProfileImage!.url.toString()
                              : "",
                          errorWidget: (BuildContext context, url, data) {
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
                      text: '${user?.firstName} ${user?.lastName}',
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
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
  }
}
