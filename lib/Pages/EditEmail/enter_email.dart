import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/AccountRecovery/account_recovery.dart';
import 'package:dating_app/Pages/CreateAccount/create_account.dart';
import 'package:dating_app/Pages/EditEmail/edit_email_handler.dart';
import 'package:dating_app/Pages/Login/login_handler.dart';
import 'package:dating_app/Pages/Login/select_login_method.dart';
import 'package:dating_app/widget/Button/facebook_btn.dart';
import 'package:dating_app/widget/Button/google_btn.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class EditUserEmail extends StatefulWidget {
  static const routeName = '/EditUserEmail';

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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: AppText(
                        size: 21.sp,
                        fontFamily:
                            GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                .fontFamily,
                        text: "ail Address",
                      ),
                    ),
                    SizedBox(height: 10.h),
                    FormFieldWidget(
                      icon: IconButton(
                        icon: const Icon(Icons.email_outlined),
                        onPressed: () {},
                      ),
                      hintText: 'Email',
                      textEditingController: editEmailController,
                      validator: emailValidator,
                      obSecure: false,
                      border: editEmailController.text.isEmpty ? 1.r : 2.r,
                      borderColor: editEmailController.text.isEmpty
                          ? AppStyles.greyColor
                          : AppStyles.pinkColor,
                      borderRadius: 25.r,
                    ),
                    SizedBox(height: 10.h),
                    FormFieldWidget(
                      icon: IconButton(
                        icon: const Icon(Icons.email_outlined),
                        onPressed: () {},
                      ),
                      hintText: 'Confirm your email',
                      textEditingController: confirmEmailController,
                      validator: emailValidator,
                      obSecure: false,
                      border: confirmEmailController.text.isEmpty ? 1.r : 2.r,
                      borderColor: confirmEmailController.text.isEmpty
                          ? AppStyles.greyColor
                          : AppStyles.pinkColor,
                      borderRadius: 25.r,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
