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
      talentProvider.increaseTalentPoints(widget.talent, currentRank, widget.talentTreeName);
    }
  }

  bool _checkSpellCanDecrease() {
    // rules: can decrease if
    // 1. currentRank > 0
    // 2. has no talent dependency
    // 3. retain enough points for higher tier spell if it is checked

    // 1. if currentRank is 0, then cannot decrease
    if (currentRank <= 0) {
      return false;
    }
    // 2. if this talent has support spell, check if that support one is selected
    // if yes, cannot decrease
    for (final supportSpell in widget.talent.support) {
      Talent dependencyTalent = talentProvider.findTalentByName(supportSpell);
      if (dependencyTalent.points > 0) {
        return false;
      }
    }

    // check widget talent spell tier,
    // then check total points in that tier
    // if have enough points, let decrease
    int currentTier = widget.talent.tier;
    Talent highestTalent = talentProvider.findHighestTierSpell(widget.talentTreeName);
    int highestTier = highestTalent.tier;

    // if the decrease spell is not the highest tier
    if (currentTier < highestTier) {
      // then check for current tier, if enough points in the current tier to decrease
      int requiredCurrentTierPoints = currentTier * 5;
      int currentTierPoints = talentProvider.findTierSum(currentTier, widget.talentTreeName);
      if (requiredCurrentTierPoints >= currentTierPoints) {
        return false;
      }
      // check for highest required points
      int requiredNextTopTierPoints = (highestTier -1) * 5;
      int nextTopTierPoints = talentProvider.findTierSum(highestTier - 1, widget.talentTreeName);
      if (requiredNextTopTierPoints >= nextTopTierPoints) {
        return false;
      }

    }

    return true;
  }

  void _decreaseRank() {

    if (_checkSpellCanDecrease()) {
      talentProvider.decreaseTalentPoints(widget.talent, currentRank, widget.talentTreeName);
    } // else show toast to let user know cannot decrease
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
            borderRadius: BorderRadius.circular(14), // icon curve border magic number
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
