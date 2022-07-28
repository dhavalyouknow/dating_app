import 'package:dating_app/Bloc/Event/event_bloc.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  initState() {
    super.initState();

    BlocProvider.of<EventBloc>(context).add(GetEventList());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
