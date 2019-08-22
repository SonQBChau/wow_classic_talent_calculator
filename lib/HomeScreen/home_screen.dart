import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen.dart';
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
        builder: (context) => DetailScreen(className: className, classColor: classColor),
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
          backgroundColor: Color(0xFFe6cc80),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/druid.png', fit: BoxFit.fitWidth),
            ),
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/hunter.png', fit: BoxFit.fitWidth),
            ),
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/mage.png', fit: BoxFit.fitWidth),
            ),
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/paladin.png', fit: BoxFit.fitWidth),
            ),
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/priest.png', fit: BoxFit.fitWidth),
            ),
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/rogue.png', fit: BoxFit.fitWidth),
            ),
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/shaman.png', fit: BoxFit.fitWidth),
            ),
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/warlock.png', fit: BoxFit.fitWidth),
            ),
            Container(
              height: 150,
              width: SizeConfig.screenWidth,
              color: kColorGreenHunter,
              child: Image.asset('assets/Class/warrior.png', fit: BoxFit.fitWidth),
            ),


          ],
        ));
  }
}
