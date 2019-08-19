import 'package:flutter/foundation.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';

class TalentProvider extends ChangeNotifier {
  int _totalPoints;
  int _firstTalentTreePoints;
  int _secondTalentTreePoints;
  int _thirdTalentTreePoints;
  SpecTreeList specTreeList;

  TalentProvider(
      this._totalPoints,
      this._firstTalentTreePoints,
      this._secondTalentTreePoints,
      this._thirdTalentTreePoints,
      this.specTreeList);

  getFirstTalentTree() => specTreeList.specTrees[0].talents.talent;
  getSecondTalentTree() => specTreeList.specTrees[1].talents.talent;
  getThirdTalentTree() => specTreeList.specTrees[2].talents.talent;

  getTotalPoint() => _totalPoints;

  getTalentTreePoints(String talentTree) {
    if (talentTree == kFirstTalentTree) {
      return _firstTalentTreePoints;
    } else if (talentTree == kSecondTalentTree) {
      return _secondTalentTreePoints;
    }
    if (talentTree == kThirdTalentTree) {
      return _thirdTalentTreePoints;
    }
  }

  void increaseTreePoints(String talentTree) {
    if (talentTree == kFirstTalentTree) {
      _firstTalentTreePoints++;
    } else if (talentTree == kSecondTalentTree) {
      _secondTalentTreePoints++;
    } else if (talentTree == kThirdTalentTree) {
      _thirdTalentTreePoints++;
    }

    notifyListeners();
  }

  void decrease(String talentTree) {
    if (talentTree == kFirstTalentTree) {
      _firstTalentTreePoints--;
    } else if (talentTree == kSecondTalentTree) {
      _secondTalentTreePoints--;
    } else if (talentTree == kThirdTalentTree) {
      _thirdTalentTreePoints--;
    }
    notifyListeners();
  }

  void increaseTalentPoints(Talent talent, int currentRank) {
    talent.points = currentRank + 1;
    notifyListeners();
  }

  void decreaseTalentPoints(Talent talent, int currentRank) {
    talent.points = currentRank - 1;
    notifyListeners();
  }

  /// return the talent by name
  Talent findTalentByName(String name) {
    List<SpecTree> specTrees = specTreeList.specTrees;
    for (int i = 0; i < specTrees.length; i++) {
      List<Talent> talents = specTrees[i].talents.talent;
      for (int j = 0; j < talents.length; j++) {
        if (talents[j].name == name) {
          return talents[j];
        }
      }
    }
    return null;
  }
}
