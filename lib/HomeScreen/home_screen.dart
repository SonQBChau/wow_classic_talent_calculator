import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/class_widget.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
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

  _handleOnTap(BuildContext context, String className, Color classColor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailScreen(className: className, classColor: classColor),
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
          title: Text('Classic Talent Calculator'),
          centerTitle: true,
          backgroundColor: kColorGold,
        ),
        body: ListView(
          children: <Widget>[
            ClassWidget(
              className: 'druid',
            ),
            ClassWidget(
              className: 'hunter',
            ),
            ClassWidget(
              className: 'mage',
            ),
            ClassWidget(
              className: 'paladin',
            ),
            ClassWidget(
              className: 'priest',
            ),
            ClassWidget(
              className: 'rogue',
            ),
            ClassWidget(
              className: 'shaman',
            ),
            ClassWidget(
              className: 'warlock',
            ),
            ClassWidget(
              className: 'warrior',
            ),
          ],
        ));
  }
}
