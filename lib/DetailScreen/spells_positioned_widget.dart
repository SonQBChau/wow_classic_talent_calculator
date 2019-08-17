import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/spell_widget.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class SpellsPositionedWidget extends StatelessWidget {
  final List<Talent> specTalentList;
  SpellsPositionedWidget({@required this.specTalentList});

  _buildTalentTree() {
    List<Widget> talentTree = [];
    for (int i = 0; i < specTalentList.length; i++) {
      Widget spell = Positioned(
        top: specTalentList[i].position[0].toDouble() * SizeConfig.cellSize,
        left: specTalentList[i].position[1].toDouble() * SizeConfig.cellSize,
        child: SpellWidget(talent: specTalentList[i]),
      );
      talentTree.add(spell);
    }
    return talentTree;
  }

  _buildArrows() {
    List<Widget> arrows = [];
    arrows.add(MediumArrowWidget(space: SizeConfig.cellSize));
    arrows.add(ShortArrowWidget(space: SizeConfig.cellSize));
    arrows.add(RightShortArrowWidget(space: SizeConfig.cellSize));
    return arrows;
  }

  @override
  Widget build(BuildContext context) {
//    final double screenWidth = MediaQuery.of(context).size.width;
//    final double space = (screenWidth -40) / 4;

    if (specTalentList.length == 0) {
      return SizedBox();
    } else {
      return LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  maxHeight: SizeConfig.cellSize * 7 + kTalentScreenPadding * 2, // cell size * number of row + padding
                ),
                child:
                    Container(
                      padding: EdgeInsets.symmetric(vertical: kTalentScreenPadding, horizontal: kTalentScreenPadding),
                        child: Stack(children: <Widget>[..._buildTalentTree(), ..._buildArrows()]))));
      });
    }
  }
}
