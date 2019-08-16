import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

class SpellWidget extends StatelessWidget {
  final Talent talent;
  SpellWidget({@required this.talent});


  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey();
    String spellName = talent.icon.toLowerCase();
    String imgLocation = 'assets/Icons/$spellName.png';
    int maxRank = talent.ranks.rank.length;

    return Container(
//      color: Colors.grey,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
        Tooltip(
            key: key,
            verticalOffset: -32,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            message: talent.ranks.rank[0].description
        ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () {print('${talent.name}');},
                onLongPress: () {
                  final dynamic tooltip = key.currentState;
                  tooltip.ensureTooltipVisible();

                },
                child: Image.asset(imgLocation)
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                '0/$maxRank',
              style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
