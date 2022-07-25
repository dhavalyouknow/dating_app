import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowProfileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final User? user;

  const ShowProfileWidget({
    Key? key,
    required this.onTap,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 80.h,
            width: 80.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: user!.squareProfileImage!.isNotEmpty
                    ? user!.squareProfileImage!.first.url.toString()
                    : "",
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
                size: 18.sp,
                text: '${user!.firstName} ${user!.lastName}',
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w600).fontFamily,
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
                    Text(
                      '${user!.city}',
                      style: TextStyle(fontSize: 10.sp),
                    )
                  ],
                ),
              SizedBox(height: 5.h),
              if (user!.dog.isNotEmpty)
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width / 7,
                          child: Stack(
                            children: [
                              if (user!.dog.length > 1)
                                Positioned(
                                  left: 18.w,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: AppStyles.myPageGradientColor,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            user!.dog[1].circleProfileImage !=
                                                    null
                                                ? user!.dog[1]
                                                    .circleProfileImage!.url
                                                    .toString()
                                                : "",
                                        errorWidget:
                                            (BuildContext context, url, data) {
                                          return const ImageErrorWidget();
                                        },
                                        height: 20.h,
                                        width: 20.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: AppStyles.myPageGradientColor,
                                  ),
                                ),
                                padding: const EdgeInsets.all(3.0),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: user!.dog[0].circleProfileImage !=
                                            null
                                        ? user!.dog[0].circleProfileImage!.url
                                            .toString()
                                        : "",
                                    errorWidget:
                                        (BuildContext context, url, data) {
                                      return const ImageErrorWidget();
                                    },
                                    height: 20.h,
                                    width: 20.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5.w),
                    AppText(
                      size: 14.sp,
                      text: "${user!.dog.length} Dogs",
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                    )
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
