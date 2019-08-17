import 'package:flutter/material.dart';

class MediumArrowWidget extends StatelessWidget {
  final double space;
  MediumArrowWidget({@required this.space});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2 * space + space / 1.3 -2,
          left: 2 * space + space / 3,
          child: Container(
              width: 20,
              height: 123,
              child: Image.asset(
                'assets/Arrows/ArrowBody.png',
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
          top: 4 * space,
          left: 2 * space + space / 3,
          child: Container(
              width: 20,
              child: Image.asset(
                'assets/Arrows/ArrowHead.png',
                fit: BoxFit.fill,
              )),
        )
      ],
    );
  }
}

class ShortArrowWidget extends StatelessWidget {
  final double space;
  ShortArrowWidget({@required this.space});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 4 * space + space / 1.3 - 2,
          left: 1 * space + space / 3,
          child: Container(
              width: 20,
              height: 25,
              child: Image.asset(
                'assets/Arrows/ArrowBody.png',
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
          top: 5 * space,
          left: 1 * space + space / 3,
          child: Container(
              width: 20,
              child: Image.asset(
                'assets/Arrows/ArrowHead.png',
                fit: BoxFit.fill,
              )),
        )
      ],
    );
  }
}

class RightShortArrowWidget extends StatelessWidget {
  final double space;
  RightShortArrowWidget({@required this.space});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 4 * space + space / 3 ,
          left: 2 * space + space / 1.3 -2,
          child: Container(
              width: 23,
              height: 20,
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  'assets/Arrows/ArrowBody.png',
                  fit: BoxFit.fill,
                ),
              )),
        ),
        Positioned(
          top: 4 * space + space / 3 ,
          left: 3 * space - space / 12 + 6,
          child: Container(
//              width: 20,
              height: 20,
              child: RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/Arrows/ArrowHead.png',
                  fit: BoxFit.fill,
                ),
              )),
        )
      ],
    );
  }
}