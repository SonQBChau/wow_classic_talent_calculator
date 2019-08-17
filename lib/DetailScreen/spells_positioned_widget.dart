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

  _buildArrows(double space) {
    List<Widget> arrows = [];

    String imgLocation = 'assets/Arrows/ArrowMedium.png';

    Widget arrow = Positioned(
      top: 2 * space + space / 1.3,
      left: 2 * space + space / 3,
      child: Container(
          width: 20,
          height: 121,
          child: Image.asset('assets/Arrows/ArrowBody.png', fit: BoxFit.fill,)),
    );
    arrows.add(arrow);
    Widget arrow2 = Positioned(
      top: 4 * space ,
      left: 2 * space + space / 3,
      child: Container(
//        color: Colors.green,
        width: 20,

          child: Image.asset('assets/Arrows/ArrowHead.png', fit: BoxFit.fill,)
      ),
    );
    arrows.add(arrow2);
    return arrows;
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
                child: Stack(children: <Widget>[
                  ..._buildTalentTree(space),
                  ..._buildArrows(space)
                ])));
      });
    }
  }
}
