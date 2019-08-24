import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/right_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

getPaladinArrowList() {
  var arrowList = [
    [
      ArrowWidget(
        startPosition: Position(row: 3, column: 1),
        endPosition: Position(row: 4, column: 1),
        lengthType: 'short',
        dependencyTalent: 'Divine Favor',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Holy Shock',
      )

    ],
    [
      ArrowWidget(
        startPosition: Position(row: 0, column: 2),
        endPosition: Position(row: 2, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Shield Specialization',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Holy Shield',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 2, column: 1),
        endPosition: Position(row: 5, column: 1),
        lengthType: 'long',
        dependencyTalent: 'Repentance',
      )
    ]
  ];
  return arrowList;
}