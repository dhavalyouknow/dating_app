// import 'package:dating_app/Constant/Appstyles/appstyles.dart';
// import 'package:dating_app/Constant/Apptext/apptext.dart';
// import 'package:dating_app/Dialog/AddActivities/add_activities_handler.dart';
// import 'package:dating_app/Pages/SetupProfile/set_up_profile1/setup_profile1_handler.dart';
// import 'package:dating_app/widget/Button/gradient_button.dart';
// import 'package:dating_app/widget/interests_chip_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:numberpicker/numberpicker.dart';
//
// class SelectedLength extends StatefulWidget {
//   final Function(List<String>) callback;
//   final List<String> alsoSelected;
//   const SelectedLength({
//     Key? key,
//     required this.callback,
//     required this.alsoSelected,
//   }) : super(key: key);
//
//   @override
//   State<SelectedLength> createState() => _SelectedLengthState();
// }
//
// class _SelectedLengthState extends State<SelectedLength>
//     with SetupProfile1Handlers {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     int length = widget.alsoSelected.length;
//     int _currentIntValue = 10;
//     int _currentHorizontalIntValue = 10;
//
//     return Scaffold(
//       backgroundColor: AppStyles.trasnparentColor,
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20.h),
//         margin: EdgeInsets.only(top: 50.h),
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//           color: AppStyles.whiteColor,
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: 10.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: AppText(
//                     size: 15.sp,
//                     text: "Cancel",
//                     fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
//                         .fontFamily,
//                   ),
//                 ),
//                 AppText(
//                   size: 18.sp,
//                   text: "Select Length",
//                   fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
//                       .fontFamily,
//                 ),
//                 SizedBox(width: 60.w)
//               ],
//             ),
//             SizedBox(height: 10.h),
//             NumberPicker(
//               value: 0,
//               minValue: 0,
//               maxValue: 150,
//               step: 1,
//               itemHeight: 80,
//               axis: Axis.vertical,
//               onChanged: (value) =>
//                   setState(() => _currentHorizontalIntValue = value),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: Colors.black26),
//               ),
//             ),
//             GradientBtn(
//               borderRadius: 10.r,
//               height: size.height / 14,
//               txt: "Save",
//               onTap: () {
//                 setState(() {});
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
