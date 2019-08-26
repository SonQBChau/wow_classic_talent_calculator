import 'package:wow_classic_talent_calculator/ClassArrow/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/right_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/right_corner_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

getDruidArrowList() {
  var arrowList = [
    [
      RightArrowWidget(
        startPosition: Position(row: 0, column: 1),
        endPosition: Position(row: 0, column: 2),
        lengthType: 'short',
        dependencyTalent: "Improved Nature's Grasp",
      ),
      ArrowWidget(
        startPosition: Position(row: 1, column: 1),
        endPosition: Position(row: 3, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Vengeance',
      ),
      ArrowWidget(
        startPosition: Position(row: 1, column: 2),
        endPosition: Position(row: 2, column: 2),
        lengthType: 'short',
        dependencyTalent: 'Omen of Clarity',
      ),
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 2, column: 2),
        endPosition: Position(row: 3, column: 2),
        lengthType: 'short',
        dependencyTalent: 'Blood Frenzy',
      ),
      ArrowWidget(
        startPosition: Position(row: 3, column: 1),
        endPosition: Position(row: 5, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Heart of the Wild',
      ),
      RightCornerArrowWidget(
        startPosition: Position(row: 2, column: 2),
        endPosition: Position(row: 3, column: 3),
        lengthType: 'short',
        dependencyTalent: 'Primal Fury',
      ),
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 1, column: 0),
        endPosition: Position(row: 4, column: 0),
        lengthType: 'long',
        dependencyTalent: "Nature's Swiftness",
      ),
      ArrowWidget(
        startPosition: Position(row: 2, column: 2),
        endPosition: Position(row: 4, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Gift of Nature',
      ),
      ArrowWidget(
        startPosition: Position(row: 3, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'long',
        dependencyTalent: 'Swiftmend',
      ),
    ]
  ];
  return arrowList;
}
