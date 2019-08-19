import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/spell_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';
import 'package:provider/provider.dart';

class TalentTreeWidget extends StatelessWidget {
  List<Talent> talentList;
  final List<Widget> arrowList;
  final String talentTreeName;
  int usedTalentPoints = 0;

  TalentTreeWidget(
      {
      // @required this.talentList,
      @required this.arrowList,
      this.talentTreeName});

  _buildTalentTree() {
    List<Widget> talentTree = [];
    for (int i = 0; i < talentList.length; i++) {
      Widget spell = Positioned(
          top: talentList[i].position[0].toDouble() * SizeConfig.cellSize,
          left: talentList[i].position[1].toDouble() * SizeConfig.cellSize,
          child: SpellWidget(
            talentList: talentList,
            talent: talentList[i],
            talentTree: this.talentTreeName,
            currentPoint: talentList[i].points,
          ));
      talentTree.add(spell);
    }
    //need to associate talent spell with arrow
    return talentTree;
  }

  _buildArrowTree() {
    return [
      ArrowWidget(
        startPosition: Position(row: 3, column: 3),
        endPosition: Position(row: 5, column: 3),
        lengthType: 'medium',
        dependencyTalent: 'Amplify Curse',
        talentList: talentList,
      ),
      ArrowWidget(
        startPosition: Position(row: 5, column: 2),
        endPosition: Position(row: 6, column: 2),
        lengthType: 'short',
        dependencyTalent: 'Siphon Life',
        talentList: talentList,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final talentProvider = Provider.of<TalentProvider>(context);
    // talentList = talentProvider.getFirstTalentTree();
    // print(talentProvider.specTreeList);
    talentList = talentProvider.getFirstTalentTree();
    // print(this.talentList);

    if (talentList.length == 0) {
      return SizedBox();
    } else {
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
                      // ...arrowList
                      ..._buildArrowTree()
                    ]))));
      });
    }
  }
}
