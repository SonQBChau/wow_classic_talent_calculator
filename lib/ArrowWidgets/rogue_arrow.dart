import 'package:wow_classic_talent_calculator/ArrowWidgets/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/right_corner_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

getRogueArrowList() {
  var arrowList = [
    [
      ArrowWidget(
        startPosition: Position(row: 0, column: 2),
        endPosition: Position(row: 2, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Lethality',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 5, column: 1),
        lengthType: 'short',
        dependencyTalent: 'Seal Fate',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 1, column: 2),
        endPosition: Position(row: 3, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Dual Wield Specialization',
      ),
      ArrowWidget(
        startPosition: Position(row: 1, column: 2),
        endPosition: Position(row: 2, column: 2),
        lengthType: 'short',
        dependencyTalent: 'Riposte',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 5, column: 1),
        lengthType: 'short',
        dependencyTalent: 'Weapon Expertise',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Premeditation',
      ),
      RightCornerArrowWidget(
        startPosition: Position(row: 3, column: 2),
        endPosition: Position(row: 4, column: 3),
        lengthType: 'short',
        dependencyTalent: 'Dirty Deeds',
      )
    ]
  ];
  return arrowList;
}
