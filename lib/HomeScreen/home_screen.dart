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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ListTile(
                    title: Text('Druid'),
                    trailing: Image.asset('assets/Class/class_druid.png'),
                    onTap: () => _handleOnTap(context, 'druid', kColorOrangeDruid),
                  ),
                ),
              ),
            ),
//            Expanded(
//              child: GestureDetector(
//                onTap: () => _handleOnTap(context, 'druid', kColorOrangeDruid),
//                child: Container(
//                  color: kColorOrangeDruid,
//                  child:  Row(
//                    children: <Widget>[
//                      Image.asset('assets/Class/class_druid.png'),
//                      Text('Druid'),
//                    ],
//                  ),
//                ),
//              ),
//            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'hunter', kColorGreenHunter),
                child: Container(
                  color: kColorGreenHunter,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/Class/class_hunter.png'),
                      Text('Hunter'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'mage', kColorBlueMage),
                child: Container(

                  color: kColorBlueMage,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/Class/class_mage.png'),
                      Text('Mage'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'paladin', kColorPinkPaladin),
                child: Container(

                  color: kColorPinkPaladin,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/Class/class_paladin.png'),
                      Text('Paladin'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'priest', kColorWhitePriest),
                child: Container(

                  color: kColorWhitePriest,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/Class/class_priest.png'),
                      Text('Priest'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'rogue', kColorYellowRogue),
                child: Container(

                  color: kColorYellowRogue,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/Class/class_rogue.png'),
                      Text('Rogue'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'shaman', kColorBlueShaman),
                child: Container(

                  color: kColorBlueShaman,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/Class/class_shaman.png'),
                      Text('Shaman'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'warlock', kColorPurpleWarlock),
                child: Container(

                  color: kColorPurpleWarlock,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/Class/class_warlock.png'),
                      Text('Warlock'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _handleOnTap(context, 'warrior', kColorTanWarrior),
                child: Container(

                  color: kColorTanWarrior,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/Class/class_warrior.png'),
                      Text('Warrior'),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ));
  }
}
