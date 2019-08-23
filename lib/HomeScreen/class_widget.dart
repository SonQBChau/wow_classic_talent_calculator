import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
import 'package:wow_classic_talent_calculator/utils/string.dart' as str;

class ClassWidget extends StatelessWidget {
  final String className;
  ClassWidget({this.className});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                str.capitalize(className),
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kColorSelectiveYellow),
              )),
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
//                 begin: Alignment.centerRight,
//                 end: Alignment.centerLeft,
                begin: Alignment(0.4, 0),
                end: Alignment(-1, 0),
//                colors: [Colors.black, Colors.transparent],
                // Add one stop for each color. Stops should increase from 0 to 1
//                stops: [0.1, 0.5, 0.7, 0.9],
                stops: [0.1, 0.6, 0.7, 1],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.black,
                  Colors.black26,
                  Colors.black12,
                  Colors.transparent,
                ],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              'assets/Class/$className.png',
              height: 100,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
