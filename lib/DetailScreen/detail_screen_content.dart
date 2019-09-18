import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/talent_tree_widget.dart';
import 'package:wow_classic_talent_calculator/IntroScreen/intro_screen.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/fade_transition.dart';
import 'package:wow_classic_talent_calculator/utils/string.dart' as str;

// detail screen content below the tabs bar
class DetailScreenContent extends StatefulWidget {
  final String className;
  final Color classColor;
  TalentTrees talentTrees;
  var arrowTrees;
  DetailScreenContent(
      {this.className, this.talentTrees, this.arrowTrees, this.classColor});

  @override
  _DetailScreenContentState createState() => _DetailScreenContentState();
}

class _DetailScreenContentState extends State<DetailScreenContent>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void saveTalent() {
    print("save talent");

    String json = jsonEncode(widget.talentTrees);
    print(json);
  }

  void loadTalent() {
    print("load talent");
  }

  void showHelp() {
    print("show help");
    _showDialog();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: IntroScreen(),
          // content: Text("Alert Dialog body"),
        );
      },
    );
  }

  void handlePopupMenuSelect(String value) {
    if (value == 'Load') {
      loadTalent();
    } else if (value == 'Save') {
      saveTalent();
    } else if (value == 'Help') {
      showHelp();
    }
  }

  @override
  Widget build(BuildContext context) {
    // get the current level to display at the top corner
    // display level 10 for starting
    int level = Provider.of<TalentProvider>(context).getTotalTalentPoints();
    if (level == 9) {
      level = 10;
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kColorSelectiveYellow),
        title: Text(
          str.capitalize(widget.className),
          style: TextStyle(color: kColorSelectiveYellow),
        ),
        actions: <Widget>[
          // level label
          Center(
            child: Container(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Level $level',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: kColorSelectiveYellow),
              ),
            ),
          ),
          // overflow menu
          PopupMenuButton<String>(
            // color: kColorSelectiveYellow,
            onSelected: (value) {
              handlePopupMenuSelect(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Help",
                child: Text("Help"),
              ),
            ],
          ),
        ],
        backgroundColor: kColorLightLicorice,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: widget.classColor,
          tabs: [
            Tab(
                icon: Image.asset(
              "assets/Icons/${widget.talentTrees.specTrees[0].icon}.png",
              width: kTabIconSize,
            )),
            Tab(
                icon: Image.asset(
              "assets/Icons/${widget.talentTrees.specTrees[1].icon}.png",
              width: kTabIconSize,
            )),
            Tab(
                icon: Image.asset(
              "assets/Icons/${widget.talentTrees.specTrees[2].icon}.png",
              width: kTabIconSize,
            )),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/background/${widget.talentTrees.specTrees[0].background}.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: TalentTreeWidget(
                talentTreeName: widget.talentTrees.specTrees[0].name,
                arrowList: widget.arrowTrees[0]),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/background/${widget.talentTrees.specTrees[1].background}.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: TalentTreeWidget(
                talentTreeName: widget.talentTrees.specTrees[1].name,
                arrowList: widget.arrowTrees[1]),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/background/${widget.talentTrees.specTrees[2].background}.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: TalentTreeWidget(
                talentTreeName: widget.talentTrees.specTrees[2].name,
                arrowList: widget.arrowTrees[2]),
          )
        ],
      ),
    );
  }
}
