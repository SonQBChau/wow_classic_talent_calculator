import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/spell_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class TalentTreeWidget extends StatelessWidget {
  final List<Talent> specTalentList;
  final List<Widget> arrowList;
  TalentTreeWidget({
    @required this.specTalentList,
    @required this.arrowList
  });

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
                        child: Stack(children: <Widget>[..._buildTalentTree(), ...arrowList]))));
      });
    }
  }
}
