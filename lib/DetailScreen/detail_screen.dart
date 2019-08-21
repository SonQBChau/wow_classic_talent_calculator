import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/warlock_arrow.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/talent_tree_widget.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'dart:convert';
import 'package:wow_classic_talent_calculator/utils/constants.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class DetailScreen extends StatefulWidget {
  final String className;
  DetailScreen({this.className});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
   TalentTrees talentTrees;

   Future<String> loadJson() async {
     return await rootBundle.loadString('data_repo/${widget.className}.json');
   }

   ///parse json to object
   Future<TalentTrees> loadTalent() async {
     String jsonTalent = await loadJson();
     final jsonResponse = json.decode(jsonTalent);
     TalentTrees localSpecTreeList = TalentTrees.fromJson(jsonResponse);
     return localSpecTreeList;
   }

   Future buildTalentList() async {
     TalentTrees loadedSpecTreeList = await loadTalent();
     setState(() {
       talentTrees = loadedSpecTreeList;
     });
   }

  @override
  initState() {
    super.initState();
     buildTalentList();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    //TODO: move SizeConfig to main page

    return Scaffold(
      appBar: AppBar(
        title: Text('Warlock'),
        actions: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'Level 60',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
        backgroundColor: Color(0xFF673AB7),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
                icon: Image.asset(
              "assets/Icons/spell_shadow_requiem.png",
              width: kTabIconSize,
            )),
            Tab(
                icon: Image.asset(
              "assets/Icons/spell_shadow_metamorphosis.png",
              width: kTabIconSize,
            )),
            Tab(
                icon: Image.asset(
              "assets/Icons/spell_fire_fireball.png",
              width: kTabIconSize,
            )),
          ],
        ),
      ),
      body: talentTrees == null
          ? CircularProgressIndicator()
          : ChangeNotifierProvider<TalentProvider>(
        builder: (_) => TalentProvider(0, 0, 0, talentTrees),
        child: TabBarView(
          controller: _tabController,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Warlock/Affliction.png"),
                  fit: BoxFit.cover,
                ),

              ),
              child: TalentTreeWidget(
                  talentTreeName: talentTrees.specTrees[0].name,
                  arrowList: getAfflictionArrowList()),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Warlock/Demonology.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: TalentTreeWidget(
                  talentTreeName: talentTrees.specTrees[1].name,
                  arrowList: getDemonologyArrowList()),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Warlock/Destruction.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: TalentTreeWidget(
                  talentTreeName: talentTrees.specTrees[2].name,
                  arrowList: getDestructionArrowList()),
            )
          ],
        ),
      ),
    );
  }
}
