import 'package:wow_classic_talent_calculator/ClassArrow/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/right_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/right_corner_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

getWarlockArrowList() {
  var arrowList = [
    [
      ArrowWidget(
        startPosition: Position(row: 2, column: 2),
        endPosition: Position(row: 4, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Curse of Exhaustion',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 5, column: 1),
        lengthType: 'short',
        dependencyTalent: 'Shadow Mastery',
      ),
      RightArrowWidget(
        startPosition: Position(row: 4, column: 2),
        endPosition: Position(row: 4, column: 3),
        lengthType: 'short',
        dependencyTalent: 'Improved Curse of Exhaustion',
      ),
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 2, column: 1),
        endPosition: Position(row: 3, column: 1),
        lengthType: 'short',
        dependencyTalent: 'Master Summoner',
      ),
      ArrowWidget(
        startPosition: Position(row: 3, column: 2),
        endPosition: Position(row: 5, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Master Demonologist',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Soul Link',
      ),
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 3, column: 0),
        endPosition: Position(row: 4, column: 0),
        lengthType: 'short',
        dependencyTalent: 'Pyroclasm',
      ),
      ArrowWidget(
        startPosition: Position(row: 2, column: 2),
        endPosition: Position(row: 4, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Ruin',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Conflagrate',
      ),
    ]
  ];
  return arrowList;
}
