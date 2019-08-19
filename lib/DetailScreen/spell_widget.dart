import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class SpellWidget extends StatefulWidget {
  final Talent talent;
  final String talentTree;
  SpellWidget({@required this.talent, this.talentTree});

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
      int newRank = currentRank + 1;
      talentPointProvider.increase(widget.talentTree);
      widget.talent.points = newRank.toString();
      setState(() {
        currentRank = newRank;
      });
    }
  }

  void _decreaseRank(talentPointProvider) {
    if (currentRank > 0) {
      int newRank = currentRank - 1;
      talentPointProvider.decrease(widget.talentTree);
      widget.talent.points = newRank.toString();
      setState(() {
        currentRank = newRank;
      });
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

  _setEnable(){
    final talentPointProvider = Provider.of<TalentProvider>(context);
    final int currentPoints = talentPointProvider.getTalentTreePoints(widget.talentTree);
    final int tierPoints =  int.parse(widget.talent.tier) * 5 - 5;
    if (currentPoints >= tierPoints){
      enableState = true;
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
    if (widget.talent.points != '') {
      currentRank = int.parse(widget.talent.points);
    }

  }

  @override
  Widget build(BuildContext context) {
    final talentPointProvider = Provider.of<TalentProvider>(context);
//    print(talentPointProvider.getTotalPoint());
    _setEnable();

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
                '$currentRank/$maxRank',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
