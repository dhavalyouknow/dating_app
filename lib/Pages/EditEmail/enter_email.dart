import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/EditEmail/edit_email_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditUserEmail extends StatefulWidget {
  static const routeName = 'EditUserEmail';

  const EditUserEmail({Key? key}) : super(key: key);

  @override
  State<EditUserEmail> createState() => _EditUserEmailState();
}

class _EditUserEmailState extends State<EditUserEmail> with EditEmailHandler {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppStyles.blackColor),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/mail.png",
                    width: 200.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Center(
                      child: AppText(
                        size: 21.sp,
                        fontFamily:
                            GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                .fontFamily,
                        text: AppLocalizations.of(context)!.emailAddress,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.h),
                  FormFieldWidget(
                    backgroundColor: AppStyles.whiteColor,
                    icon: IconButton(
                      icon: const Icon(Icons.email_outlined),
                      onPressed: () {},
                    ),
                    hintText: 'Enter your new email',
                    textEditingController: confirmEmailController,
                    validator: emailValidator,
                    obSecure: false,
                    border: confirmEmailController.text.isEmpty ? 1.r : 2.r,
                    borderColor: confirmEmailController.text.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.pinkColor,
                    borderRadius: 25.r,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  GradientBtn(
                    onTap: () {
                      editEmail();
                    },
                    borderRadius: 25,
                    height: size.height / 16,
                    txt: 'Update Email',
                  )
                ],
              ),
            ),
          ),
          if (isLoading) const LoadingWidget()
        ],
      ),
    );
  }
}
