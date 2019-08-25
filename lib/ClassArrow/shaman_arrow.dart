import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/right_corner_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

getShamanArrowList() {
  var arrowList = [
    [
      ArrowWidget(
        startPosition: Position(row: 2, column: 2),
        endPosition: Position(row: 5, column: 2),
        lengthType: 'long',
        dependencyTalent: 'Lightning Mastery',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Elemental Mastery',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 1, column: 1),
        endPosition: Position(row: 3, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Flurry',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Stormstrike',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 3, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'long',
        dependencyTalent: 'Mana Tide Totem',
      )
    ]
  ];
  return arrowList;
}
