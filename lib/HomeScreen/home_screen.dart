import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  TalentTrees talentTrees;

  Future<String> loadJson() async {
    return await rootBundle.loadString('data_repo/warlock.json');
  }

  ///parse json to object
  Future<TalentTrees> loadTalent() async {
    String jsonTalent = await loadJson();
    final jsonResponse = json.decode(jsonTalent);
    TalentTrees localSpecTreeList = TalentTrees.fromJson(jsonResponse);
    return localSpecTreeList;
  }

  Future buildTalentList() async {
    talentTrees = await loadTalent();
  }

  _handleOnTap(BuildContext context, String className) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(className: className),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //home_screen is the first page render that can calculate screen size
    SizeConfig().init(context);
    buildTalentList();

    return Scaffold(
        appBar: AppBar(
          title: Text('WoW Classic Talent Calculator'),
          backgroundColor: Color(0xFF673AB7),
        ),
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () => _handleOnTap(context, 'warlock'),
              child: Container(
                height: 150,
                color: Colors.amber[600],
                child: const Center(child: Text('Warlock')),
              ),
            ),
            Container(
              height: 150,
              color: Colors.amber[500],
              child: const Center(child: Text('Warrior')),
            ),
            Container(
              height: 150,
              color: Colors.amber[100],
              child: const Center(child: Text('Priest')),
            ),
          ],
        ));
  }
}
