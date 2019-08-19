import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class SpellWidget extends StatefulWidget {
  final List<Talent> talentList;
  final Talent talent;
  final String talentTreeName;
  final int currentPoint;
  SpellWidget(
      {@required this.talent,
      this.talentTreeName,
      this.talentList,
      this.currentPoint});

  @override
  _SpellWidgetState createState() => _SpellWidgetState();
}

class _SpellWidgetState extends State<SpellWidget> {
  final key = new GlobalKey();
  int currentRank = 0;
  bool enableState = false;
  String spellName = '';
  String imgLocation = '';
  int maxRank = 0;

  void _increaseRank(talentPointProvider) {
    if (currentRank < maxRank) {
      currentRank++;
      talentPointProvider.increase(widget.talentTreeName);
      talentPointProvider.setTalentPoint(widget.talent, currentRank);
      // print('increase rank');
      // widget.talent.points = newRank.toString();
      // setState(() {
      //   currentRank = newRank;
      // });
    }
  }

  void _decreaseRank(talentPointProvider) {
    //check for dependency
    if (currentRank > 0) {
      currentRank--;
      talentPointProvider.decrease(widget.talentTreeName);
      talentPointProvider.setTalentPoint(widget.talent, currentRank);
      // widget.talent.points = newRank.toString();
      // setState(() {
      //   currentRank = newRank;
      // });
    }
  }

  void _showDescription() {
    final dynamic tooltip = key.currentState;
    tooltip.ensureTooltipVisible();
  }

  String _getDescription() {
    int displayRank = currentRank - 1;
    if (displayRank < 0) {
      displayRank = 0;
      return 'Learn: ${widget.talent.ranks.rank[displayRank].description}';
    }
    return widget.talent.ranks.rank[displayRank].description;
  }

  findTalentByName(String name) {
    for (int i = 0; i < widget.talentList.length; i++) {
      if (widget.talentList[i].name == name) {
        return widget.talentList[i];
      }
    }
    return null;
  }

  _setEnable() {
    final talentPointProvider = Provider.of<TalentProvider>(context);
    final int currentPoints =
        talentPointProvider.getTalentTreePoints(widget.talentTreeName);
    final int tierPoints = widget.talent.tier * 5 - 5;
    // first, check for enough points for tier
    if (currentPoints >= tierPoints) {
      //second, check for dependency
      if (widget.talent.dependency != '') {
        Talent dependencyTalent = findTalentByName(widget.talent.dependency);
        if (dependencyTalent.points ==
            dependencyTalent.ranks.rank.length.toString()) {
          enableState = true;
          widget.talent.enable = true;
        } else {
          enableState = false;
          widget.talent.enable = false;
        }
      } else {
        enableState = true;
        widget.talent.enable = true;
      }
    } else {
      enableState = false;
      widget.talent.enable = false;
    }
  }

  _buildSpellWidget(counter) {
    if (enableState) {
      return GestureDetector(
          onTap: () => _increaseRank(counter),
          onDoubleTap: () => _decreaseRank(counter),
          onLongPress: () => _showDescription(),
          child: Container(child: Image.asset(imgLocation)));
    } else {
      return GestureDetector(
        onLongPress: () => _showDescription(),
        child: Container(
            foregroundDecoration: BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
                borderRadius: BorderRadius.circular(6)),
            child: Image.asset(imgLocation)),
      );
    }
  }

  @override
  initState() {
    super.initState();
    // Add listeners to this class
    spellName = widget.talent.icon.toLowerCase();
    imgLocation = 'assets/Icons/$spellName.png';
    maxRank = widget.talent.ranks.rank.length;
  }

  @override
  Widget build(BuildContext context) {
    final talentPointProvider = Provider.of<TalentProvider>(context);
    _setEnable();
    // String currentPoint = widget.currentPoint == '' ? '0' : widget.currentPoint;

    return Container(
      width: SizeConfig.cellSize,
      height: SizeConfig.cellSize,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Tooltip(
            key: key,
            verticalOffset: -32,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            message: _getDescription(),
          ),
          Align(
            alignment: Alignment.center,
            child: _buildSpellWidget(talentPointProvider),
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
                '${widget.currentPoint}/$maxRank',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
