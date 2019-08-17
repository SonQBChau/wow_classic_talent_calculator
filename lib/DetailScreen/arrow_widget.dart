import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';

class ArrowWidget extends StatelessWidget {
  final Position startPosition;
  final Position endPosition;
  final String lengthType;
  ArrowWidget({
    @required this.startPosition,
    @required this.endPosition,
    @required this.lengthType,
  });

  @override
  Widget build(BuildContext context) {
    final double arrowBodyTop = SizeConfig.cellSize * startPosition.row - SizeConfig.cellSize/7;
    final double arrowBodyLeft = SizeConfig.cellSize * startPosition.column - SizeConfig.cellSize/1.6;
    final double arrowBodyWidth = kArrowWidthSize;
    double arrowBodyHeight = 0;
    final double arrowHeadTop = SizeConfig.cellSize * (endPosition.row-1);
    final double arrowHeadLeft = SizeConfig.cellSize * startPosition.column - SizeConfig.cellSize/1.6;
    final double arrowHeadWidth = kArrowWidthSize;

    if(lengthType == 'medium'){
      arrowBodyHeight = SizeConfig.cellSize * 1.15; //magic number
    } else if(lengthType == 'short') {
      arrowBodyHeight = SizeConfig.cellSize * 0.15; //magic number
    }

    return Stack(
      children: <Widget>[
        Positioned(
          top: arrowBodyTop,
          left: arrowBodyLeft,
          child: Container(
              width: arrowBodyWidth,
              height: arrowBodyHeight,
              child: Image.asset(
                'assets/Arrows/ArrowBody.png',
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
          top: arrowHeadTop,
          left: arrowHeadLeft,
          child: Container(
              width: arrowHeadWidth,
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