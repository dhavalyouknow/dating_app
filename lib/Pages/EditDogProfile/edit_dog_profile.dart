import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/EditDogProfile/edit_dog_handler.dart';
import 'package:dating_app/widget/TextformfieldWidget/edit_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDogProfile extends StatefulWidget {
  static const routeName = '/EditDogProfile';
  const EditDogProfile({Key? key}) : super(key: key);

  @override
  State<EditDogProfile> createState() => _EditDogProfileState();
}

class _EditDogProfileState extends State<EditDogProfile> with EditDogHandlers {
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
                // Navigator.pop(context);
              },
              icon: Icon(
                size: 30.h,
                Icons.close,
                color: AppStyles.greyColor,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppStyles.greyColor,
              size: 30.h,
            ),
          ),
        ),
        backgroundColor: AppStyles.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: "Edit dog profile",
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
            children: [
              // Container(
              //   decoration:
              //       const BoxDecoration(color: AppStyles.lightGreyColor),
              //   height: 300.h,
              //   child: Center(
              //     child: Image.asset(
              //       "assets/Dog.png",
              //       color: AppStyles.whiteColor,
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.camera_alt_outlined),
                          SizedBox(width: 10.w),
                          AppText(
                            size: 18.sp,
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                    .fontFamily,
                            text: "Add Picture",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              size: 18.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                              text: "Dog ",
                            ),
                            SizedBox(height: 5.h),
                            EditFormField(
                              height: size.height / 16,
                              width: size.width / 1.5,
                              textEditingController: editDogNameController,
                              hintTxt: "Enter Dog Name",
                            ),
                            // AppText(
                            //   size: 14.sp,
                            //   fontFamily: GoogleFonts.raleway(
                            //           fontWeight: FontWeight.w500)
                            //       .fontFamily,
                            //   text: "Milo",
                            // ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         AppText(
                    //           size: 18.sp,
                    //           fontFamily: GoogleFonts.raleway(
                    //                   fontWeight: FontWeight.w700)
                    //               .fontFamily,
                    //           text: "About",
                    //         ),
                    //         SizedBox(height: 5.h),
                    //         AppText(
                    //           size: 14.sp,
                    //           fontFamily: GoogleFonts.raleway(
                    //                   fontWeight: FontWeight.w500)
                    //               .fontFamily,
                    //           text: "Lorem ipsum dolor sit amet, consectetur",
                    //         ),
                    //       ],
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.edit),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              size: 18.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                              text: "Gender",
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              size: 14.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500)
                                  .fontFamily,
                              text: "Male",
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    )
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
