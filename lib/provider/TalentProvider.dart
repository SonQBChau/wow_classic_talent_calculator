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

  void increase(String talentTree) {
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

  void setTalentPoint(Talent talent, int newRank) {
    talent.points = newRank + 1;
    notifyListeners();
    // print(newRank);
  }
}
