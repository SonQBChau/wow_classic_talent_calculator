import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class SpellWidget extends StatefulWidget {
  final Talent talent;
  SpellWidget({@required this.talent});

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

  void _increaseRank() {
    if (currentRank < maxRank) {
      int newRank = currentRank + 1;
      setState(() {
        currentRank = newRank;
      });
    }
  }

  void _decreaseRank() {
    if (currentRank > 0) {
      int newRank = currentRank - 1;
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

  _buildSpellWidget() {
    if (enableState) {
      return GestureDetector(
          onTap: () => _increaseRank(),
          onDoubleTap: () => _decreaseRank(),
          onLongPress: () => _showDescription(),
          child: Container(
              // foregroundDecoration: BoxDecoration(
              //   color: Colors.grey,
              //   backgroundBlendMode: BlendMode.saturation,
              // ),
              child: Image.asset(imgLocation)));
    } else {
      return Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.grey,
            backgroundBlendMode: BlendMode.saturation,
            borderRadius: BorderRadius.circular(6)
            
          ),
          child: Image.asset(imgLocation)
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
