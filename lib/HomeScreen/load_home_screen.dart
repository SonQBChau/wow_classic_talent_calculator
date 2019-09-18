import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/home_screen.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

///https://flutter.dev/docs/cookbook/networking/fetch-data
/// This widget use to load json 1 time only and pass to home screen
/// so the home screen won't fetch everytime it rebuild
class LoadHomeScreen extends StatelessWidget {
  Future<String> loadJson(String name) async {
    return await rootBundle.loadString('data_repo/$name.json');
  }

  Future<List> loadTalentString(String name) async {
    String jsonTalent = await loadJson(name);
    final jsonResponse = json.decode(jsonTalent);
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      druidTalentTrees: loadTalentString('druid'),
      hunterTalentTrees: loadTalentString('hunter'),
      mageTalentTrees: loadTalentString('mage'),
      paladinTalentTrees: loadTalentString('paladin'),
      priestTalentTrees: loadTalentString('priest'),
      rogueTalentTrees: loadTalentString('rogue'),
      shamanTalentTrees: loadTalentString('shaman'),
      warlockTalentTrees: loadTalentString('warlock'),
      warriorTalentTrees: loadTalentString('warrior'),
    );
  }
}
