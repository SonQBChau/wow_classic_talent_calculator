import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/home_screen.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

///https://flutter.dev/docs/cookbook/networking/fetch-data
/// This widget use to load json 1 time only and pass to home screen
/// so the home screen won't fetch everytime it rebuild
class LoadHomeScreen extends StatelessWidget {
  Future<TalentTrees> druidTalentTrees;
  Future<TalentTrees> hunterTalentTrees;
  Future<TalentTrees> mageTalentTrees;
  Future<TalentTrees> paladinTalentTrees;
  Future<TalentTrees> priestTalentTrees;
  Future<TalentTrees> rogueTalentTrees;
  Future<TalentTrees> shamanTalentTrees;
  Future<TalentTrees> warlockTalentTrees;
  Future<TalentTrees> warriorTalentTrees;
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
  Future<TalentTrees> loadTalent(String name) async {
    String jsonTalent = await loadJson(name);
    final jsonResponse = json.decode(jsonTalent);
    TalentTrees talentTreesObject = TalentTrees.fromJson(jsonResponse);
    return talentTreesObject;
  }

  Future<List> loadTalentString(String name) async {
    String jsonTalent = await loadJson(name);
    final jsonResponse = json.decode(jsonTalent);
    return jsonResponse;
  }

  // this function should only called 1 the entire app
  Future _loadAllClassesTalent() async {
    druidTalentTrees = loadTalent('druid');
    hunterTalentTrees = loadTalent('hunter');
    mageTalentTrees = loadTalent('mage');
    paladinTalentTrees = loadTalent('paladin');
    priestTalentTrees = loadTalent('priest');
    rogueTalentTrees = loadTalent('rogue');
    shamanTalentTrees = loadTalent('shaman');
    warlockTalentTrees = loadTalent('warlock');
    warriorTalentTrees = loadTalent('warrior');

    druidTalentString = loadTalentString('druid');
    hunterTalentString = loadTalentString('hunter');
    mageTalentString = loadTalentString('mage');
    paladinTalentString = loadTalentString('paladin');
    priestTalentString = loadTalentString('priest');
    rogueTalentString = loadTalentString('rogue');
    shamanTalentString = loadTalentString('shaman');
    warlockTalentString = loadTalentString('warlock');
    warriorTalentString = loadTalentString('warrior');
  }

  @override
  Widget build(BuildContext context) {
    _loadAllClassesTalent();

    return HomeScreen(
      druidTalentTrees: druidTalentString,
      hunterTalentTrees: hunterTalentString,
      mageTalentTrees: mageTalentString,
      paladinTalentTrees: paladinTalentString,
      priestTalentTrees: priestTalentString,
      rogueTalentTrees: rogueTalentString,
      shamanTalentTrees: shamanTalentString,
      warlockTalentTrees: warlockTalentString,
      warriorTalentTrees: warriorTalentString,
    );
  }
}
