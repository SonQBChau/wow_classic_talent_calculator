import 'package:wow_classic_talent_calculator/ClassArrow/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/right_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/right_corner_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

getWarriorArrowList() {
  var arrowList = [
    [
      ArrowWidget(
        startPosition: Position(row: 0, column: 2),
        endPosition: Position(row: 2, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Deep Wounds',
      ),
      ArrowWidget(
        startPosition: Position(row: 1, column: 1),
        endPosition: Position(row: 2, column: 1),
        lengthType: 'short',
        dependencyTalent: 'Anger Managementy',
      ),
      ArrowWidget(
        startPosition: Position(row: 2, column: 2),
        endPosition: Position(row: 3, column: 2),
        lengthType: 'short',
        dependencyTalent: 'Impale',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Mortal Strike',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 3, column: 2),
        endPosition: Position(row: 5, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Flurry',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Bloodthirst',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 0, column: 1),
        endPosition: Position(row: 2, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Improved Shield Block',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Shield Slam',
      )
    ]
  ];
  return arrowList;
}
