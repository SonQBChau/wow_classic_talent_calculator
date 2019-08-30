import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/class_widget.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/home_screen.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

/// Main Home Page, show for normal log in
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
  }

  @override
  Widget build(BuildContext context) {
    _loadAllClassesTalent();

    return HomeScreen(
      druidTalentTrees: druidTalentTrees,
      hunterTalentTrees: hunterTalentTrees,
      mageTalentTrees: mageTalentTrees,
      paladinTalentTrees: paladinTalentTrees,
      priestTalentTrees: priestTalentTrees,
      rogueTalentTrees: rogueTalentTrees,
      shamanTalentTrees: shamanTalentTrees,
      warlockTalentTrees: warlockTalentTrees,
      warriorTalentTrees: warriorTalentTrees,
    );
  }
}
