import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';

class ArrowWidget extends StatefulWidget {
  final Position startPosition;
  final Position endPosition;
  final String lengthType;
  final String dependencyTalent;
  ArrowWidget({
    @required this.startPosition,
    @required this.endPosition,
    @required this.lengthType,
    @required this.dependencyTalent,
  });

  @override
  _ArrowWidgetState createState() => _ArrowWidgetState();
}

class _ArrowWidgetState extends State<ArrowWidget> {
  String arrowBodyImg = 'assets/Arrows/GreyArrowBody.png';
  String arrowHeadImg = 'assets/Arrows/GreyArrowHead.png';
  var talentProvider;
  double arrowBodyTop;
  double arrowBodyLeft;
  double arrowBodyWidth;
  double arrowBodyHeight;
  double arrowHeadTop;
  double arrowHeadLeft;
  double arrowHeadWidth;

  setEnable() {
    Talent dependencyTalent =
        talentProvider.findTalentByName(widget.dependencyTalent);
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

  void _calculatePositions() {
    arrowBodyTop = SizeConfig.cellSize * widget.startPosition.row -
        SizeConfig.cellSize / 7;
    arrowBodyLeft = SizeConfig.cellSize * widget.startPosition.column -
        SizeConfig.cellSize / 1.6;
    arrowBodyWidth = kArrowWidthSize;
    arrowBodyHeight = 0;
    arrowHeadTop = SizeConfig.cellSize * (widget.endPosition.row - 1);
    arrowHeadLeft = SizeConfig.cellSize * widget.startPosition.column -
        SizeConfig.cellSize / 1.6;
    arrowHeadWidth = kArrowWidthSize;

    if (widget.lengthType == 'long') {
      arrowBodyHeight = SizeConfig.cellSize * 2.15; //magic number
    } else if (widget.lengthType == 'medium') {
      arrowBodyHeight = SizeConfig.cellSize * 1.15; //magic number
    } else if (widget.lengthType == 'short') {
      arrowBodyHeight = SizeConfig.cellSize * 0.15; //magic number
    }
  }

  @override
  void initState() {
    _calculatePositions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    talentProvider = Provider.of<TalentProvider>(context);
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
