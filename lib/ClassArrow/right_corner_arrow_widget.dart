import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';

class RightCornerArrowWidget extends StatefulWidget {
  final Position startPosition;
  final Position endPosition;
  final String lengthType;
  final String dependencyTalent;
  RightCornerArrowWidget({
    @required this.startPosition,
    @required this.endPosition,
    @required this.lengthType,
    @required this.dependencyTalent,
  });

  @override
  _RightCornerArrowWidgetState createState() => _RightCornerArrowWidgetState();
}

class _RightCornerArrowWidgetState extends State<RightCornerArrowWidget> {
  String arrowBodyImg = 'assets/Arrows/GreyArrowBody.png';
  String arrowHeadImg = 'assets/Arrows/GreyArrowHead.png';
  String arrowCornerImg = 'assets/Arrows/GreyArrowCorner.png';
  var talentProvider;
  double arrowBodyTop;
  double arrowBodyLeft;
  double arrowBodyWidth;
  double arrowBodyHeight;
  double arrowHeadTop;
  double arrowHeadLeft;
  double arrowHeadWidth;
  double rightArrowBodyTop;
  double rightArrowBodyLeft;
  double rightArrowBodyHeight;
  double rightArrowBodyWidth;
  double arrowCornerTop;
  double arrowCornerLeft;

  setEnable() {
    Talent dependencyTalent =
        talentProvider.findTalentByName(widget.dependencyTalent);
    if (dependencyTalent != null) {
      if (dependencyTalent.enable) {
        setState(() {
          arrowBodyImg = 'assets/Arrows/ArrowBody.png';
          arrowHeadImg = 'assets/Arrows/ArrowHead.png';
          arrowCornerImg = 'assets/Arrows/ArrowCorner.png';
        });
      } else {
        arrowBodyImg = 'assets/Arrows/GreyArrowBody.png';
        arrowHeadImg = 'assets/Arrows/GreyArrowHead.png';
        arrowCornerImg = 'assets/Arrows/GreyArrowCorner.png';
      }
    }
  }

  void _calculatePositions() {
    arrowBodyTop = SizeConfig.cellSize * (widget.startPosition.row) -
        SizeConfig.cellSize / 2;
    arrowBodyLeft = SizeConfig.cellSize * (widget.startPosition.column + 1) -
        SizeConfig.cellSize / 1.6;
    arrowBodyWidth = kArrowWidthSize;
    arrowBodyHeight = 0;

    arrowHeadTop = SizeConfig.cellSize * (widget.endPosition.row - 1);
    arrowHeadLeft = SizeConfig.cellSize * (widget.startPosition.column + 1) -
        SizeConfig.cellSize / 1.6;
    arrowHeadWidth = kArrowWidthSize;
    rightArrowBodyTop = SizeConfig.cellSize * widget.startPosition.row -
        SizeConfig.cellSize / 1.6;
    rightArrowBodyLeft = SizeConfig.cellSize * widget.startPosition.column -
        SizeConfig.cellSize / 7;

    rightArrowBodyHeight = kArrowWidthSize;
    rightArrowBodyWidth = SizeConfig.cellSize * 0.52;

    arrowCornerTop = SizeConfig.cellSize * (widget.startPosition.row) -
        SizeConfig.cellSize / 1.67;
    arrowCornerLeft = SizeConfig.cellSize * (widget.startPosition.column + 1) -
        SizeConfig.cellSize / 1.58;

    if (widget.lengthType == 'long') {
      arrowBodyHeight = SizeConfig.cellSize * 2.15; //magic number
    } else if (widget.lengthType == 'medium') {
      arrowBodyHeight = SizeConfig.cellSize * 1.15; //magic number
    } else if (widget.lengthType == 'short') {
      arrowBodyHeight = SizeConfig.cellSize * 0.5; //magic number
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
        /// horizontal bar
        Positioned(
          top: rightArrowBodyTop,
          left: rightArrowBodyLeft,
          child: Container(
              width: rightArrowBodyWidth,
              height: rightArrowBodyHeight,
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  arrowBodyImg,
                  fit: BoxFit.fill,
                ),
              )),
        ),

        /// vertical bar (scale)
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

        /// right corner piece
        Positioned(
          top: arrowCornerTop,
          left: arrowCornerLeft,
          child: Container(
              width: SizeConfig.cellSize * 0.2,
              height: SizeConfig.cellSize * 0.2,
              child: Image.asset(
                arrowCornerImg,
                fit: BoxFit.fill,
              )),
        ),

        /// arrow piece
        Positioned(
          top: arrowHeadTop,
          left: arrowHeadLeft,
          child: Container(
              width: arrowHeadWidth,
              child: Image.asset(
                arrowHeadImg,
                fit: BoxFit.fill,
              )),
        ),
      ],
    );
  }
}
