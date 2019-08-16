import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:wow_classic_talent_calculator/DetailScreen/spell_grid_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/spell_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/spells_positioned_widget.dart';
import 'dart:convert';

import 'package:wow_classic_talent_calculator/model/talent.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static const NUM_OF_TILES = 28; // 6 rows and 4 columns
  // SpecTreeList specTreeList;
  List<Widget> specOneWidgetList = [];
  List<Widget> specTwoWidgetList = [];
  List<Widget> specThreeWidgetList = [];

  Future<String> loadJson() async {
    return await rootBundle.loadString('data_repo/warlock.json');
  }

  Future<SpecTreeList> loadTalent() async {
    String jsonTalent = await loadJson();
    final jsonResponse = json.decode(jsonTalent);
    SpecTreeList specTreeList = SpecTreeList.fromJson(jsonResponse);
    return specTreeList;
  }

  Future buildTalentList() async {
    final widgetListOne = <Widget>[];
    final widgetListTwo = <Widget>[];
    final widgetListThree = <Widget>[];
    SpecTreeList specTreeList = await loadTalent();
    List<Talent> specListOne = specTreeList.specTrees[0].talents.talent;
    List<Talent> specListTwo = specTreeList.specTrees[1].talents.talent;
    List<Talent> specListThree = specTreeList.specTrees[2].talents.talent;

    // fill the widget with empty blocks
    for (var i = 0; i < NUM_OF_TILES; i++) {
      widgetListOne.add(BlockTile());
      widgetListTwo.add(BlockTile());
      widgetListThree.add(BlockTile());
    }

    // fill the widget with talent spec items
    for (var i = 0; i < specListOne.length; i++) {
      List<int> positions = specListOne[i].position;
      int pos = (positions[0] * 4) + (positions[1]); // row + column
      widgetListOne[pos] = SpellWidget(talent: specListOne[i]);
    }
    for (var i = 0; i < specListTwo.length; i++) {
      List<int> positions = specListTwo[i].position;
      int pos = (positions[0] * 4) + (positions[1]); // row + column

      widgetListTwo[pos] = SpellWidget(talent: specListTwo[i]);
    }
    for (var i = 0; i < specListThree.length; i++) {
      List<int> positions = specListThree[i].position;
      int pos = (positions[0] * 4) + (positions[1]); // row + column
      widgetListThree[pos] = SpellWidget(talent: specListThree[i]);
    }

    setState(() {
      specOneWidgetList = widgetListOne;
      specTwoWidgetList = widgetListTwo;
      specThreeWidgetList = widgetListThree;
    });
  }

  @override
  initState() {
    super.initState();
    buildTalentList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Warlock'),
                backgroundColor: Color(0xFF673AB7),
                bottom: TabBar(
                  tabs: [
                    Tab(
                        icon: Image.asset(
                      "assets/Icons/spell_shadow_requiem.png",
                      width: 32,
                    )),
                    Tab(
                        icon: Image.asset(
                      "assets/Icons/spell_shadow_metamorphosis.png",
                      width: 32,
                    )),
                    Tab(
                        icon: Image.asset(
                      "assets/Icons/spell_fire_fireball.png",
                      width: 32,
                    )),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Warlock/Affliction.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: SpellGridWidget(specWidgetList: specOneWidgetList),
                    child: SpellsPositionedWidget(
                        specWidgetList: specOneWidgetList),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Warlock/Demonology.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SpellGridWidget(specWidgetList: specTwoWidgetList),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Warlock/Destruction.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SpellGridWidget(specWidgetList: specThreeWidgetList),
                  )
                ],
              ),
            )));
  }
}

class BlockTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(),
      // Container(
      //   margin: EdgeInsets.all(1),
      //   color: Colors.transparent,
      //   width: double.infinity,
      //   height: double.infinity,
      // ),
    );
  }
}
