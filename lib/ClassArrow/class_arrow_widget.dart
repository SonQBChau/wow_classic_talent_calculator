import 'package:wow_classic_talent_calculator/ClassArrow/warlock_arrow.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/right_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

getArrowClassByName(String className) {
  switch (className) {
    case 'warlock':
      {
        return getWarlockArrowList();
      }
      break;

    case 'druid':
      {
        return getDruidArrowList();
      }
      break;

    default:
      {
        //statements;
        return [
          getAfflictionArrowList(),
          getDemonologyArrowList(),
          getDestructionArrowList(),
        ];
      }
      break;
  }
}

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
      // ArrowWidget(
      //   startPosition: Position(row: 5, column: 2),
      //   endPosition: Position(row: 7, column: 2),
      //   lengthType: 'medium',
      //   dependencyTalent: 'Soul Link',
      // ),
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
