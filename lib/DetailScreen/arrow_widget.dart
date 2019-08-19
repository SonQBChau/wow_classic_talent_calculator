import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';

class ArrowWidget extends StatefulWidget {
  final Position startPosition;
  final Position endPosition;
  final String lengthType;
  final String dependencyTalent;
  final List<Talent> talentList;
  ArrowWidget({
    @required this.startPosition,
    @required this.endPosition,
    @required this.lengthType,
    @required this.dependencyTalent,
    @required this.talentList,
  });

  @override
  _ArrowWidgetState createState() => _ArrowWidgetState();
}

class _ArrowWidgetState extends State<ArrowWidget> {
  String arrowBodyImg = 'assets/Arrows/GreyArrowBody.png';
  String arrowHeadImg = 'assets/Arrows/GreyArrowHead.png';

  findTalentByName(String name) {
    for (int i = 0; i < widget.talentList.length; i++) {
      if (widget.talentList[i].name == name) {
        return widget.talentList[i];
      }
    }
    return null;
  }

  setEnable() {
    Talent dependencyTalent = findTalentByName(widget.dependencyTalent);
    if (dependencyTalent != null) {
      if (dependencyTalent.enable) {
        setState(() {
          arrowBodyImg = 'assets/Arrows/ArrowBody.png';
          arrowHeadImg = 'assets/Arrows/ArrowHead.png';
        });
      } else {
        arrowBodyImg = 'assets/Arrows/GreyArrowBody.png';
        arrowHeadImg = 'assets/Arrows/GreyArrowHead.png';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double arrowBodyTop = SizeConfig.cellSize * widget.startPosition.row -
        SizeConfig.cellSize / 7;
    final double arrowBodyLeft =
        SizeConfig.cellSize * widget.startPosition.column -
            SizeConfig.cellSize / 1.6;
    final double arrowBodyWidth = kArrowWidthSize;
    double arrowBodyHeight = 0;
    final double arrowHeadTop =
        SizeConfig.cellSize * (widget.endPosition.row - 1);
    final double arrowHeadLeft =
        SizeConfig.cellSize * widget.startPosition.column -
            SizeConfig.cellSize / 1.6;
    final double arrowHeadWidth = kArrowWidthSize;

    if (widget.lengthType == 'medium') {
      arrowBodyHeight = SizeConfig.cellSize * 1.15; //magic number
    } else if (widget.lengthType == 'short') {
      arrowBodyHeight = SizeConfig.cellSize * 0.15; //magic number
    }

    // set arrow enable or disable depend on the state of talent spell
    setEnable();

    return Stack(
      children: <Widget>[
        Positioned(
          top: arrowBodyTop,
          left: arrowBodyLeft,
          child: Container(
              width: arrowBodyWidth,
              height: arrowBodyHeight,
              child: Image.asset(
                arrowBodyImg,
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
          top: arrowHeadTop,
          left: arrowHeadLeft,
          child: Container(
              width: arrowHeadWidth,
              child: Image.asset(
                arrowHeadImg,
                fit: BoxFit.fill,
              )),
        )
      ],
    );
  }
}

class RightArrowWidget extends StatelessWidget {
  final Position startPosition;
  final Position endPosition;
  final String lengthType;
  RightArrowWidget({
    @required this.startPosition,
    @required this.endPosition,
    @required this.lengthType,
  });

  @override
  Widget build(BuildContext context) {
    final double arrowBodyTop =
        SizeConfig.cellSize * startPosition.row - SizeConfig.cellSize / 1.6;
    final double arrowBodyLeft =
        SizeConfig.cellSize * startPosition.column - SizeConfig.cellSize / 7;
    final double arrowBodyHeight = kArrowWidthSize;
    double arrowBodyWidth = 0;
    final double arrowHeadTop =
        SizeConfig.cellSize * endPosition.row - SizeConfig.cellSize / 1.6;
    final double arrowHeadLeft = SizeConfig.cellSize * startPosition.column;
    final double arrowHeadHeight = kArrowWidthSize;

    if (lengthType == 'short') {
      arrowBodyWidth = SizeConfig.cellSize * 0.15; //magic number
    }

    return Stack(
      children: <Widget>[
        Positioned(
          top: arrowBodyTop,
          left: arrowBodyLeft,
          child: Container(
              width: arrowBodyWidth,
              height: arrowBodyHeight,
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  'assets/Arrows/ArrowBody.png',
                  fit: BoxFit.fill,
                ),
              )),
        ),
        Positioned(
          top: arrowHeadTop,
          left: arrowHeadLeft,
          child: Container(
              height: arrowHeadHeight,
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
