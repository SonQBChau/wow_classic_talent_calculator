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
          title: Text('WoW Classic Talent Calculator'),
          backgroundColor: Color(0xFF673AB7),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'druid', kColorOrangeDruid),
                child: Container(
                  color: kColorOrangeDruid,
                  child: const Center(child: Text('Druid')),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'hunter', kColorGreenHunter),
                child: Container(
                  color: kColorGreenHunter,
                  child: const Center(child: Text('Hunter')),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'mage', kColorBlueMage),
                child: Container(

                  color: kColorBlueMage,
                  child: const Center(child: Text('Mage')),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'paladin', kColorPinkPaladin),
                child: Container(

                  color: kColorPinkPaladin,
                  child: const Center(child: Text('Paladin')),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'priest', kColorWhitePriest),
                child: Container(

                  color: kColorWhitePriest,
                  child: const Center(child: Text('Priest')),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'rogue', kColorYellowRogue),
                child: Container(

                  color: kColorYellowRogue,
                  child: const Center(child: Text('Rogue')),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'shaman', kColorBlueShaman),
                child: Container(

                  color: kColorBlueShaman,
                  child: const Center(child: Text('Shaman')),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'warlock', kColorPurpleWarlock),
                child: Container(

                  color: kColorPurpleWarlock,
                  child: const Center(child: Text('Warlock')),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'warrior', kColorTanWarrior),
                child: Container(

                  color: kColorTanWarrior,
                  child: const Center(child: Text('Warrior')),
                ),
              ),
            ),

          ],
        ));
  }
}
