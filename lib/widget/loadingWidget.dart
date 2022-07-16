import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppStyles.textColor,
        ),
      ),
    );
  }
}
