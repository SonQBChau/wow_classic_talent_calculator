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

  getTalentTreePoints(String talentTreeName) {
    if (talentTreeName == specTreeList.specTrees[0].name) {
      return _firstTalentTreePoints;
    } else if (talentTreeName == specTreeList.specTrees[1].name) {
      return _secondTalentTreePoints;
    }
    if (talentTreeName == specTreeList.specTrees[2].name) {
      return _thirdTalentTreePoints;
    }
  }

  void increaseTreePoints(String talentTreeName) {
    if (talentTreeName == specTreeList.specTrees[0].name) {
      _firstTalentTreePoints++;
    } else if (talentTreeName == specTreeList.specTrees[1].name) {
      _secondTalentTreePoints++;
    } else if (talentTreeName == specTreeList.specTrees[2].name) {
      _thirdTalentTreePoints++;
    }

    notifyListeners();
  }

  void decreaseTreePoints(String talentTree) {
    if (talentTree == specTreeList.specTrees[0].name) {
      _firstTalentTreePoints--;
    } else if (talentTree == specTreeList.specTrees[1].name) {
      _secondTalentTreePoints--;
    } else if (talentTree == specTreeList.specTrees[2].name) {
      _thirdTalentTreePoints--;
    }
    notifyListeners();
  }

  void increaseTalentPoints(
      Talent talent, int currentRank, String talentTreeName) {
    talent.points = currentRank + 1;
    increaseTreePoints(talentTreeName);
    updateTalentTree();
    notifyListeners();
  }

  void decreaseTalentPoints(
      Talent talent, int currentRank, String talentTreeName) {
    talent.points = currentRank - 1;
    decreaseTreePoints(talentTreeName);
    updateTalentTree();
    notifyListeners();
  }

  void updateTalentTree() {
    List<SpecTree> specTrees = specTreeList.specTrees;
    for (int i = 0; i < specTrees.length; i++) {
      String specTreeName = specTrees[i].name;
      List<Talent> talents = specTrees[i].talents.talent;
      for (int j = 0; j < talents.length; j++) {
        updateTalentEnable(talents[j], specTreeName);
      }
    }
  }

  void updateTalentEnable(Talent talent, String specTreeName) {
    final int currentPoints = getTalentTreePoints(specTreeName);
    final int tierPoints = talent.tier * 5 - 5;
    // first, check for enough points for tier
    if (currentPoints >= tierPoints) {
      //second, check for dependency
      if (talent.dependency != '') {
        Talent dependencyTalent = findTalentByName(talent.dependency);
        if (dependencyTalent.points == dependencyTalent.ranks.rank.length) {
          talent.enable = true;
        } else {
          talent.enable = false;
        }
      } else {
        talent.enable = true;
      }
    } else {
      talent.enable = false;
    }
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

  /// find highest tier spell checked
  Talent findHighestTierSpell(String specTreeName) {
    Talent highestTierSpell;
    List<SpecTree> specTrees = specTreeList.specTrees;
    for (int i = 0; i < specTrees.length; i++) {
      if (specTrees[i].name == specTreeName) {
        List<Talent> talents = specTrees[i].talents.talent;
        for (int j = 0; j < talents.length; j++) {
          if (talents[j].points > 0) {
            if (highestTierSpell == null) {
              highestTierSpell = talents[j];
            } else if (talents[j].tier > highestTierSpell.tier) {
              highestTierSpell = talents[j];
            }
          }
        }
      }
      break;
    }
    return highestTierSpell;
  }
}
