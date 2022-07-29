import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/BottomBar/bottom_bar.dart';
import 'package:dating_app/Pages/ChattingPage/chatting_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChattingPage extends StatefulWidget {
  static const routeName = "/ChattingPage";

  const ChattingPage({Key? key}) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> with ChattingHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController msgController = TextEditingController();

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppStyles.greyColor,
            size: 28.sp,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.ellipsisVertical,
                size: 25.sp,
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
          text: 'Gustav Stevens',
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
        ),
      ),
      body: Container(
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
            children: [
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppStyles.primaryColor,
                    width: 3.w,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/intro/Intro1Background.png"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    color: AppStyles.pinkColor,
                    size: 14.sp,
                    text: "It's a Match",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                  Icon(
                    Icons.favorite,
                    color: AppStyles.pinkColor,
                    size: 20.sp,
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage:
                        const AssetImage("assets/intro/Intro1Background.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.w),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: AppStyles.lightGreyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: AppText(text: "Hur mår Indie?"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: AppStyles.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                    ),
                    child: AppText(text: "Hon mår toppen tack!"),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage:
                        const AssetImage("assets/intro/Intro1Background.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.w, top: 10.h),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: AppStyles.lightGreyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: AppText(
                        text: "Åh vad skönt att höra. Ska du på\nminglet?"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: AppStyles.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                    ),
                    child: AppText(text: "Ja tänkte gå dit! Ska du?"),
                  )
                ],
              ),
              SizedBox(height: size.height / 2.6),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: AppStyles.greyColor, width: 1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: FormFieldWidget(
                              backgroundColor: AppStyles.trasnparentColor,
                              validator: (value) {},
                              hintText: "Type your message",
                              textEditingController: msgController,
                              obSecure: false,
                              borderRadius: 0.r,
                              borderColor: AppStyles.trasnparentColor,
                              border: 0.r,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GradientBtn(
                              height: 35.h,
                              txt: "send",
                              onTap: () {},
                              borderRadius: 20.r,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
