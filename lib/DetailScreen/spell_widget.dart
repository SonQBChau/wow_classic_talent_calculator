import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

class SpellWidget extends StatefulWidget {
  final Talent talent;
  SpellWidget({@required this.talent});

  @override
  _SpellWidgetState createState() => _SpellWidgetState();
}

class _SpellWidgetState extends State<SpellWidget> {
  final key = new GlobalKey();
  int currentRank = 0;

  @override
  Widget build(BuildContext context) {
    String spellName = widget.talent.icon.toLowerCase();
    String imgLocation = 'assets/Icons/$spellName.png';
    final int maxRank = widget.talent.ranks.rank.length;

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

    return Container(
      color: Colors.grey,
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
            child: GestureDetector(
                onTap: () => _increaseRank(),
                onDoubleTap: () => _decreaseRank(),
                onLongPress: () => _showDescription(),
                child: Container(
                    // foregroundDecoration: BoxDecoration(
                    //   color: Colors.grey,
                    //   backgroundBlendMode: BlendMode.saturation,
                    // ),
                    child: Image.asset(imgLocation))),
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
