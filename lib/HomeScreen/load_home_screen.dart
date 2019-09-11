import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/home_screen.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

///https://flutter.dev/docs/cookbook/networking/fetch-data
/// This widget use to load json 1 time only and pass to home screen
/// so the home screen won't fetch everytime it rebuild
class LoadHomeScreen extends StatelessWidget {
  Future<List> druidTalentString;
  Future<List> hunterTalentString;
  Future<List> mageTalentString;
  Future<List> paladinTalentString;
  Future<List> priestTalentString;
  Future<List> rogueTalentString;
  Future<List> shamanTalentString;
  Future<List> warlockTalentString;
  Future<List> warriorTalentString;

  Future<String> loadJson(String name) async {
    return await rootBundle.loadString('data_repo/$name.json');
  }

  ///parse json to object
  // Future<TalentTrees> loadTalent(String name) async {
  //   String jsonTalent = await loadJson(name);
  //   final jsonResponse = json.decode(jsonTalent);
  //   TalentTrees talentTreesObject = TalentTrees.fromJson(jsonResponse);
  //   return talentTreesObject;
  // }

  Future<List> loadTalentString(String name) async {
    String jsonTalent = await loadJson(name);
    final jsonResponse = json.decode(jsonTalent);
    return jsonResponse;
  }

  // this function should only called 1 the entire app
  Future<void> _loadAllClassesTalent() async {
    List<dynamic> druidTalentString = await loadTalentString('druid');
    List<dynamic> hunterTalentString = await loadTalentString('hunter');
    List<dynamic> mageTalentString = await loadTalentString('mage');
    List<dynamic> paladinTalentString = await loadTalentString('paladin');
    List<dynamic> priestTalentString = await loadTalentString('priest');
    List<dynamic> rogueTalentString = await loadTalentString('rogue');
    List<dynamic> shamanTalentString = await loadTalentString('shaman');
    List<dynamic> warlockTalentString = await loadTalentString('warlock');
    List<dynamic> warriorTalentString = await loadTalentString('warrior');
  }

  @override
  Widget build(BuildContext context) {
    // _loadAllClassesTalent();

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
