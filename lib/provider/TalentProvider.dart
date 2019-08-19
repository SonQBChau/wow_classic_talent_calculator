import 'package:flutter/foundation.dart';
import 'package:wow_classic_talent_calculator/utils/constants.dart';

class TalentProvider extends ChangeNotifier {

  int _totalPoints ;
  int _firstTalentTreePoints ;
  int _secondTalentTreePoints ;
  int _thirdTalentTreePoints;

  TalentProvider(this._totalPoints,
      this._firstTalentTreePoints,
      this._secondTalentTreePoints,
      this._thirdTalentTreePoints);


  getTotalPoint() => _totalPoints;

  getTalentTreePoints(String talentTree){
    if (talentTree == kFirstTalentTree){
      return _firstTalentTreePoints;
    }
    else if (talentTree == kSecondTalentTree){
      return _secondTalentTreePoints;
    }
    if (talentTree == kThirdTalentTree){
     return _thirdTalentTreePoints;
    }
  }

  void increase(String talentTree) {
    if (talentTree == kFirstTalentTree){
      _firstTalentTreePoints++;
    }
    else if (talentTree == kSecondTalentTree){
      _secondTalentTreePoints++;
    }
    else if (talentTree == kThirdTalentTree){
      _thirdTalentTreePoints++;
    }

    notifyListeners();
  }

  void decrease(String talentTree) {
    if (talentTree == kFirstTalentTree){
      _firstTalentTreePoints--;
    }
    else if (talentTree == kSecondTalentTree){
      _secondTalentTreePoints--;
    }
    else if (talentTree == kThirdTalentTree){
      _thirdTalentTreePoints--;
    }
    notifyListeners();
  }
}