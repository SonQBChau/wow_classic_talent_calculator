import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class SpellWidget extends StatefulWidget {
  final Talent talent;
  final String talentTreeName;

  SpellWidget({this.talent, this.talentTreeName});

  @override
  _SpellWidgetState createState() => _SpellWidgetState();
}

class _SpellWidgetState extends State<SpellWidget> {
  final key = new GlobalKey();
  var talentProvider;
  int maxRank;
  int currentRank;
  String spellName;
  String imgLocation;
  bool enableState = false;

  void _showDescription() {
    final dynamic tooltip = key.currentState;
    tooltip.ensureTooltipVisible();
  }

  String _getDescription() {
    int displayRank = currentRank - 1;
    if (displayRank < 0) {
      displayRank = 0;
      return '${widget.talent.name}: ${widget.talent.ranks.rank[displayRank].description}';
    }
    return widget.talent.ranks.rank[displayRank].description;
  }

  void _increaseRank() {
    if (currentRank < maxRank) {
      talentProvider.increaseTalentPoints(
          widget.talent, currentRank, widget.talentTreeName);
    }
  }

  void _decreaseRank() {
    //rules: can decrease if
    // currentRank > 0
    // has no talent dependency
    // retain enough point for higher tier if checked
    if (currentRank > 0) {
      if (widget.talent.support == '') {
        // this talent has no dependency on
        talentProvider.decreaseTalentPoints(
            widget.talent, currentRank, widget.talentTreeName);
      } else {
        // if we have dependency on, check if the dependency has been checked
        Talent dependencyTalent =
            talentProvider.findTalentByName(widget.talent.support);
        if (dependencyTalent.points == 0) {
          talentProvider.decreaseTalentPoints(
              widget.talent, currentRank, widget.talentTreeName);
        }
      }
    }
  }

  _buildSpellWidget() {
    if (widget.talent.enable) {
      return GestureDetector(
          onTap: () => _increaseRank(),
          onDoubleTap: () => _decreaseRank(),
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
  Widget build(BuildContext context) {
    talentProvider = Provider.of<TalentProvider>(context);
    maxRank = widget.talent.ranks.rank.length;
    currentRank = widget.talent.points;
    spellName = widget.talent.icon.toLowerCase();
    imgLocation = 'assets/Icons/$spellName.png';

//    _setEnable();
    //draw arrow

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
            child: _buildSpellWidget(),
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
                '${widget.talent.points}/$maxRank',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
