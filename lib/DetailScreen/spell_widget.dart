import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';
// import 'package:transparent_image/transparent_image.dart';

//add ripple effect
//https://medium.com/@RayLiVerified/create-a-rounded-image-icon-with-ripple-effect-in-flutter-eb0f4a720b90

// Main widget for spell icons
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

  // show spell tooltip description on long press
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
    return 'Rank ${widget.talent.ranks.rank[displayRank].number}: ' +
        widget.talent.ranks.rank[displayRank].description;
  }

  // onTap, increase spell rank if it's not max and not over 60
  void _increaseRank() {
    if (currentRank < maxRank && talentProvider.getTotalTalentPoints() < 60) {
      talentProvider.increaseTalentPoints(
          widget.talent, currentRank, widget.talentTreeName);
    }
  }

  void _decreaseRank() {
    // rules: can decrease if
    // 1. currentRank > 0
    // 2. has no talent dependency
    // 3. retain enough points for higher tier spell if it is checked

    bool canDecrease = true;

    // 1. if currentRank is 0, then cannot decrease
    if (currentRank <= 0) {
      canDecrease = false;
    }

    // 2. if this talent has support, check if that support is checked
    // if yes, cannot decrease
    if (widget.talent.support != '') {
      ///Druid is is the ONLY special exception that has 2 dependency spells
      if (widget.talent.support == 'Blood Frenzy AND Primal Fury') {
        Talent bloodFrenzyTalent =
            talentProvider.findTalentByName('Blood Frenzy');
        Talent primalFuryTalent =
            talentProvider.findTalentByName('Primal Fury');
        if (bloodFrenzyTalent.points > 0 || primalFuryTalent.points > 0) {
          canDecrease = false;
        }
      } else if (widget.talent.support ==
          'Shadowform AND Improved Vampiric Embrace') {
        Talent shadowformTalent = talentProvider.findTalentByName('Shadowform');
        Talent impVampiricEmbraceTalent =
            talentProvider.findTalentByName('Improved Vampiric Embrace');
        if (shadowformTalent.points > 0 ||
            impVampiricEmbraceTalent.points > 0) {
          canDecrease = false;
        }
      } else {
        Talent dependencyTalent =
            talentProvider.findTalentByName(widget.talent.support);
        if (dependencyTalent.points > 0) {
          canDecrease = false;
        }
      }
    }

    // 3. retain enough points for higher tier if checked
    // need to check if it is not the current spell
    // if the current spell is not highest, check retain points
    // if required points is higher total point, cannot decrease
    Talent highestTalent =
        talentProvider.findHighestTierSpell(widget.talentTreeName);
    if (highestTalent != null && widget.talent.name != highestTalent.name) {
      int requiredTreePoints =
          (highestTalent.tier * 5 - 5) + highestTalent.points;
      int talentTreePoints =
          talentProvider.getTalentTreePoints(widget.talentTreeName);
      if (requiredTreePoints >= talentTreePoints) {
        canDecrease = false;
      }
    }

    if (canDecrease) {
      talentProvider.decreaseTalentPoints(
          widget.talent, currentRank, widget.talentTreeName);
    }
  }

  // check if spell talent is enable or not
  // disable Tap action if grey out
  _buildSpellWidget() {
    if (widget.talent.enable) {
      return Material(
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage(imgLocation),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: () => _increaseRank(),
            onDoubleTap: () => _decreaseRank(),
            onLongPress: () => _showDescription(),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        child: Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.grey,
            backgroundBlendMode: BlendMode.saturation,
            borderRadius:
                BorderRadius.circular(14), // icon curve border magic number
          ),
          child: Ink.image(
            image: AssetImage(imgLocation),
            fit: BoxFit.cover,
            child: InkWell(
              onLongPress: () => _showDescription(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
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
            child: _buildSpellWidget(), //spell icon
          ),
          Align(
            // spell rank
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
