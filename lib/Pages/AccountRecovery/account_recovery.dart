import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/AccountRecovery/account_recovery_handler.dart';
import 'package:dating_app/Pages/CreateAccount/create_account.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountRecovery extends StatefulWidget {
  static const routeName = "/AccountRecovery";
  const AccountRecovery({Key? key}) : super(key: key);

  @override
  State<AccountRecovery> createState() => _AccountRecoveryState();
}

class _AccountRecoveryState extends State<AccountRecovery>
    with AccountRecoveryHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppStyles.greyColor,
          ),
        ),
        backgroundColor: AppStyles.whiteColor,
        elevation: 0.0,
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                Center(
                  child: AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: AppLocalizations.of(context)!.accountRecovery,
                    size: 21.sp,
                  ),
                ),
                SizedBox(height: 40.h),
                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w400)
                      .fontFamily,
                  text: AppLocalizations.of(context)!.enterYourEmailAndReceive,
                  size: 15.sp,
                ),
                SizedBox(height: 15.h),
                FormFieldWidget(
                  icon: IconButton(
                    icon: const Icon(Icons.person_outline),
                    onPressed: () {},
                  ),
                  hintText: AppLocalizations.of(context)!.email,
                  textEditingController: emailController,
                  validator: emailValidator,
                  obSecure: false,
                  border: emailController.text.isEmpty ? 1.r : 2.r,
                  borderColor: emailController.text.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.pinkColor,
                  borderRadius: 10.r,
                  backgroundColor: AppStyles.trasnparentColor,
                ),
                SizedBox(height: 20.h),
                GradientBtn(
                  borderRadius: 10.r,
                  fontSize: 18.sp,
                  height: size.height / 14,
                  txt: AppLocalizations.of(context)!.sendLink,
                  onTap: () {
                    sentLink();
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.r, right: 10.r),
                      child: AppText(
                        text: AppLocalizations.of(context)!.oR,
                      ),
                    ),
                    const Expanded(
                      child: Divider(thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, CreateAccount.routeName);
                    },
                    child: AppText(
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.bold)
                              .fontFamily,
                      text: AppLocalizations.of(context)!.createNewAccount,
                      size: 20.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
