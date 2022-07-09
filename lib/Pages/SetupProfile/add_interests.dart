import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/interests_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddInterests extends StatefulWidget {
  const AddInterests({Key? key}) : super(key: key);

  @override
  State<AddInterests> createState() => _AddInterestsState();
}

class _AddInterestsState extends State<AddInterests> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        margin: EdgeInsets.only(top: 50.h),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: AppStyles.whiteColor),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: AppText(
                    size: 15.sp,
                    text: "Cancel",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ),
                AppText(
                  size: 18.sp,
                  text: "Interests",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                ),
                TextButton(
                  onPressed: () {},
                  child: AppText(
                    size: 15.sp,
                    text: "Done",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: AppText(
                    size: 15.sp,
                    text: "Interests Selected",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ),
                AppText(
                  size: 15.sp,
                  text: "3/6",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
              ],
            ),
            Wrap(
              children: [
                ...interestList.map(
                  (e) => InterestsChipWidget(
                    interestsName: e,
                  ),
                ),
              ],
            ),
            // Expanded(
            //   child: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       mainAxisSpacing: 10,
            //       crossAxisSpacing: 10,
            //       mainAxisExtent: 50,
            //     ),
            //     itemCount: interestList.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //         padding: EdgeInsets.symmetric(horizontal: 7.w),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: Colors.grey,
            //           ),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Center(child: Text(interestList[index])),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
