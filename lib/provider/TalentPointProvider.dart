import 'package:flutter/foundation.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

class TalentPointProvider extends ChangeNotifier {

  int _points;

  TalentPointProvider(this._points);

  getPoint() => _points;
  setPoint(int points) => _points = points;

  void increase() {
    _points++;
    notifyListeners();
  }

  void decrease() {
    _points--;
    notifyListeners();
  }
}