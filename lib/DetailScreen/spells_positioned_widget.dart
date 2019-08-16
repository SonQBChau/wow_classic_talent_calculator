import 'package:flutter/material.dart';

class SpellsPositionedWidget extends StatelessWidget {
  final List<Widget> specWidgetList;
  SpellsPositionedWidget({@required this.specWidgetList});

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;

    // final double screenHeight = MediaQuery.of(context).size.height;

    // print('Screen Width: $screenWidth, Screen Height: $screenHeight');

    // final double left_1 = screenWidth / 4;
    // final double top_1 = screenHeight / 4;

    // print('Left: $left_1, Top: $top_1');

    return Stack(children: <Widget>[
      Positioned(
        left: 0,
        top: 0,
        child: specWidgetList[1],
      ),
      Positioned(
        left: 0,
        top: 0,
        child: specWidgetList[2],
      ),
    ]);
  }
}
