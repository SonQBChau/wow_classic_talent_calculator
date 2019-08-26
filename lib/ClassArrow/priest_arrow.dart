import 'package:wow_classic_talent_calculator/ClassArrow/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/right_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/right_corner_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

getPriestArrowList() {
  var arrowList = [
    [
      ArrowWidget(
        startPosition: Position(row: 2, column: 2),
        endPosition: Position(row: 4, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Divine Spirit',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Power Infusion',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 1, column: 2),
        endPosition: Position(row: 3, column: 2),
        lengthType: 'medium',
        dependencyTalent: 'Searing Light',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Lightwell',
      )
    ],
    [
      ArrowWidget(
        startPosition: Position(row: 2, column: 0),
        endPosition: Position(row: 4, column: 0),
        lengthType: 'medium',
        dependencyTalent: 'Silence',
      ),
      ArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 6, column: 1),
        lengthType: 'medium',
        dependencyTalent: 'Shadowform',
      ),
      RightArrowWidget(
        startPosition: Position(row: 4, column: 1),
        endPosition: Position(row: 4, column: 2),
        lengthType: 'short',
        dependencyTalent: 'Improved Vampiric Embrace',
      ),
    ]
  ];
  return arrowList;
}
