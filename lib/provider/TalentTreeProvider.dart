import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';

class TalentTreeProvider extends ChangeNotifier {
  String _classNameJson;

  TalentTreeProvider(this._classNameJson);

  List<Talent> firstTalentTree = [];
  List<Talent> secondTalentTree = [];
  List<Talent> thirdTalentTree = [];
  SpecTreeList specTreeList;

  Future<String> loadJson() async {
    return await rootBundle.loadString(_classNameJson);
  }

  ///parse json to object
  Future<SpecTreeList> loadTalentTree() async {
    String jsonTalent = await loadJson();
    final jsonResponse = json.decode(jsonTalent);
    SpecTreeList specTreeList = SpecTreeList.fromJson(jsonResponse);
    return specTreeList;
  }

  Future buildTalentTree() async {
    specTreeList = await loadTalentTree();
    firstTalentTree = specTreeList.specTrees[0].talents.talent;
    secondTalentTree = specTreeList.specTrees[1].talents.talent;
    thirdTalentTree = specTreeList.specTrees[2].talents.talent;
  }

  getFirstTalentTree() => specTreeList.specTrees[0].talents.talent;
  getSecondTalentTree() => specTreeList.specTrees[1].talents.talent;
  getThirdTalentTree() => specTreeList.specTrees[2].talents.talent;
}
