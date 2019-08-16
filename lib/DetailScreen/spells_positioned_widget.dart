import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/spell_widget.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

class SpellsPositionedWidget extends StatelessWidget {
  final List<Talent> specTalentList;
  SpellsPositionedWidget({@required this.specTalentList});

  _buildTalentTree(double space) {
    List<Widget> talentTree = [];
    for (int i = 0; i < specTalentList.length; i++) {
      Widget spell = Positioned(
        top: specTalentList[i].position[0].toDouble() * space,
        left: specTalentList[i].position[1].toDouble() * space,
        child: SpellWidget(talent: specTalentList[i]),
      );
      talentTree.add(spell);
    }
    return talentTree;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double space = screenWidth / 4;

    if (specTalentList.length == 0) {
      return SizedBox();
    } else {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  maxHeight: space * 7,
                ),
                child: Stack(children: _buildTalentTree(space))));
      });
    }
  }
}
