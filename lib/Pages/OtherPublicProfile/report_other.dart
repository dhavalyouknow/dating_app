import 'package:dating_app/Bloc/BlockUser/block_user_bloc.dart';
import 'package:dating_app/Bloc/ReportUser/report_user_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/OtherPublicProfile/other_public_profile_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportOtherPopup extends StatefulWidget {
  final String? reportId;

  const ReportOtherPopup({
    Key? key,
    required this.reportId,
  }) : super(key: key);

  @override
  State<ReportOtherPopup> createState() => _ReportOtherPopupState();
}

class _ReportOtherPopupState extends State<ReportOtherPopup>
    with OtherPersonPublicHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userStatus) {
          return Align(
            alignment: Alignment.topRight,
            child: Container(
              height: size.height / 6,
              width: size.width / 2.2,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              margin: EdgeInsets.only(top: 55.h, right: 5.w),
              decoration: BoxDecoration(
                color: AppStyles.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<ReportUserBloc>(context).add(
                        ReportUserRequest(
                          userId: widget.reportId.toString(),
                          reportBy: userStatus.user!.id.toString(),
                          reason: "hello",
                          message: "message",
                          success: () {
                            Fluttertoast.showToast(
                              msg: 'User Reported Successfully',
                              timeInSecForIosWeb: 5,
                            );
                          },
                        ),
                      );
                      // onReportUser(widget.reportId);
                    },
                    child: AppText(
                      size: 16.sp,
                      text: "Report User",
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w500)
                              .fontFamily,
                      color: AppStyles.blackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<BlockUserBloc>(context).add(
                        BLockUserRequest(
                          myUserId: userStatus.user!.id.toString(),
                          reportUserId: widget.reportId.toString(),
                          success: () {
                            Fluttertoast.showToast(
                              msg: 'User Blocked Successfully',
                              timeInSecForIosWeb: 5,
                            );
                          },
                        ),
                      );

                      // onBlockUser(widget.reportId);
                    },
                    child: AppText(
                      size: 16.sp,
                      text: "Block User",
                      color: AppStyles.crimsonPinkColor,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w500)
                              .fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
