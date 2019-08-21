import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/spell_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';
import 'package:provider/provider.dart';

class TalentTreeWidget extends StatelessWidget {
  final List<Widget> arrowList;
  final String talentTreeName;
  TalentTreeWidget({@required this.arrowList, this.talentTreeName});

  /// contain talent list for this tree/page
  List<Talent> talentList;

  _buildTalentTree() {
    List<Widget> talentTree = [];
    for (int i = 0; i < talentList.length; i++) {
      Widget spell = Positioned(
          top: talentList[i].position[0].toDouble() * SizeConfig.cellSize,
          left: talentList[i].position[1].toDouble() * SizeConfig.cellSize,
          child: SpellWidget(
            talent: talentList[i],
            talentTreeName: this.talentTreeName,
          ));
      talentTree.add(spell);
    }
    //need to associate talent spell with arrow
    return talentTree;
  }

  @override
  Widget build(BuildContext context) {
    final talentProvider = Provider.of<TalentProvider>(context);
    talentList = talentProvider.findTalentTreeByName(talentTreeName);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                // minHeight: viewportConstraints.maxHeight,
                maxHeight: SizeConfig.cellSize * 7 +
                    kTalentScreenTwoPadding, // cell size * number of row + padding
              ),
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: kTalentScreenPadding,
                      horizontal: kTalentScreenPadding),
                  child: Stack(children: <Widget>[
                    ..._buildTalentTree(),
                    ...arrowList
                  ]))));
    });
  }
}
