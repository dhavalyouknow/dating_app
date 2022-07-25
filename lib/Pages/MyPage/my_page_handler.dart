import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_material_pickers/helpers/show_number_picker.dart';

mixin MyPageHandlers<T extends StatefulWidget> on State<T> {
  Future<void> selectLength(BuildContext context) async {
    int itemExtent = 150;
    FixedExtentScrollController scrollController =
        FixedExtentScrollController();

    var lengthPicked = CupertinoPicker(
      itemExtent: itemExtent.toDouble(),
      scrollController: scrollController,
      onSelectedItemChanged: (int value) {
        itemExtent = value;
      },
      children: [
        for (var i = 0; i <= 150; i++)
          AppText(
            text: "$i",
          )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
