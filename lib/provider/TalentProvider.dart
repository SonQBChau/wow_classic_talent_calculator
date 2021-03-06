import 'package:flutter/foundation.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

class TalentProvider extends ChangeNotifier {
  int _firstTalentTreePoints;
  int _secondTalentTreePoints;
  int _thirdTalentTreePoints;
  TalentTrees talentTrees;

  TalentProvider(this.talentTrees)
      : _firstTalentTreePoints = talentTrees.specTrees[0].points,
        _secondTalentTreePoints = talentTrees.specTrees[1].points,
        _thirdTalentTreePoints = talentTrees.specTrees[2].points;

  /// return total points of talent selected
  getTotalTalentPoints() =>
      9 + // first level to get talent is 10
      _firstTalentTreePoints +
      _secondTalentTreePoints +
      _thirdTalentTreePoints;

  /// return the total points of selected tree
  getTalentTreePoints(String talentTreeName) {
    if (talentTreeName == talentTrees.specTrees[0].name) {
      return _firstTalentTreePoints;
    } else if (talentTreeName == talentTrees.specTrees[1].name) {
      return _secondTalentTreePoints;
    }
    if (talentTreeName == talentTrees.specTrees[2].name) {
      return _thirdTalentTreePoints;
    }
  }

  /// increase the total talent points of selected tree
  void increaseTreePoints(String talentTreeName) {
    if (talentTreeName == talentTrees.specTrees[0].name) {
      _firstTalentTreePoints++;
    } else if (talentTreeName == talentTrees.specTrees[1].name) {
      _secondTalentTreePoints++;
    } else if (talentTreeName == talentTrees.specTrees[2].name) {
      _thirdTalentTreePoints++;
    }

    notifyListeners();
  }

  /// decrease the total talent points of selected tree
  void decreaseTreePoints(String talentTree) {
    if (talentTree == talentTrees.specTrees[0].name) {
      _firstTalentTreePoints--;
    } else if (talentTree == talentTrees.specTrees[1].name) {
      _secondTalentTreePoints--;
    } else if (talentTree == talentTrees.specTrees[2].name) {
      _thirdTalentTreePoints--;
    }
    notifyListeners();
  }

  /// increase the talent points of selected spell
  /// increase spell rank if it's not max and not over 60
  /// loop 5 times to max out
  void increaseTalentPoints(
      Talent talent, int currentRank, String talentTreeName) {
    int length = isSwitch ? 5 : 1;
    for (int i = 0; i < 5; i++) {
      if (talent.points < length && getTotalTalentPoints() < 60) {
        talent.points = talent.points + 1;
        increaseTreePoints(talentTreeName);
        updateTalentTree();
        notifyListeners();
      }
    }
  }

  /// decrease the talent points of selected spell
  void decreaseTalentPoints(
      Talent talent, int currentRank, String talentTreeName) {
    talent.points = currentRank - 1;
    decreaseTreePoints(talentTreeName);
    updateTalentTree();
    notifyListeners();
  }

  /// run update for the entire talent trees for enable or disable spell
  void updateTalentTree() {
    List<TalentTree> specTrees = talentTrees.specTrees;
    for (int i = 0; i < specTrees.length; i++) {
      String specTreeName = specTrees[i].name;
      List<Talent> talents = specTrees[i].talents.talent;
      for (int j = 0; j < talents.length; j++) {
        updateTalentEnable(talents[j], specTreeName);
      }
    }
  }

  /// enable or disable spell talent depend on conditions
  /// enable if:
  /// have enough talent points: current talent tree points  >= required tier (e.g tier 3 requires 10 points)
  /// if talent have dependency, check if dependency is selected
  void updateTalentEnable(Talent talent, String specTreeName) {
    final int currentPoints = getTalentTreePoints(specTreeName);
    final int tierPoints = talent.tier * 5 - 5;
    // first, check for enough points for tier
    if (currentPoints >= tierPoints) {
      //second, check for dependency
      if (talent.dependency != '') {
        Talent dependencyTalent = findTalentByName(talent.dependency);
        //check for enough required points
        if (dependencyTalent != null &&
            dependencyTalent.points == dependencyTalent.ranks.rank.length) {
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

  /// return the talent tree by tree name
  List<Talent> findTalentTreeByName(String name) {
    List<TalentTree> specTrees = talentTrees.specTrees;
    List<Talent> talentTree = [];
    for (int i = 0; i < specTrees.length; i++) {
      if (specTrees[i].name == name) {
        talentTree = specTrees[i].talents.talent;
        return talentTree;
      }
    }
    return talentTree;
  }

  /// return the talent spell by name
  Talent findTalentByName(String name) {
    List<TalentTree> specTrees = talentTrees.specTrees;
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

  /// find highest tier spell checked in current tree spec
  Talent findHighestTierSpell(String specTreeName) {
    Talent highestTierSpell;
    List<TalentTree> specTrees = talentTrees.specTrees;
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
        break;
      }
    }
    return highestTierSpell;
  }

  /// find all points up to the current tier
  int findTierSum(int currentTier, String specTreeName) {
    int totalPoints = 0;
    List<TalentTree> specTrees = talentTrees.specTrees;
    for (int i = 0; i < specTrees.length; i++) {
      if (specTrees[i].name == specTreeName) {
        List<Talent> talents = specTrees[i].talents.talent;
        for (int j = 0; j < talents.length; j++) {
          if (talents[j].tier <= currentTier) {
            totalPoints += talents[j].points;
          }
        }
        break;
      }
    }
    return totalPoints;
  }

  // lock spell or not

}
