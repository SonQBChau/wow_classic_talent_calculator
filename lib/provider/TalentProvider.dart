import 'package:flutter/foundation.dart';

class TalentProvider extends ChangeNotifier {

  int _points;

  TalentProvider(this._points);

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