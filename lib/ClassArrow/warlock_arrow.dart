import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/Arrows/right_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

List<Widget> getAfflictionArrowList() {
  return [
    ArrowWidget(
      startPosition: Position(row: 3, column: 3),
      endPosition: Position(row: 5, column: 3),
      lengthType: 'medium',
      dependencyTalent: 'Curse of Exhaustion',
    ),
    ArrowWidget(
      startPosition: Position(row: 5, column: 2),
      endPosition: Position(row: 6, column: 2),
      lengthType: 'short',
      dependencyTalent: 'Shadow Mastery',
    ),
    RightArrowWidget(
      startPosition: Position(row: 5, column: 3),
      endPosition: Position(row: 5, column: 4),
      lengthType: 'short',
      dependencyTalent: 'Improved Curse of Exhaustion',
    ),
  ];
}

List<Widget> getDemonologyArrowList() {
  return [
    ArrowWidget(
      startPosition: Position(row: 3, column: 2),
      endPosition: Position(row: 4, column: 2),
      lengthType: 'short',
      dependencyTalent: 'Master Summoner',
    ),
    ArrowWidget(
      startPosition: Position(row: 4, column: 3),
      endPosition: Position(row: 6, column: 3),
      lengthType: 'medium',
      dependencyTalent: 'Master Demonologist',
    ),
    ArrowWidget(
      startPosition: Position(row: 5, column: 2),
      endPosition: Position(row: 7, column: 2),
      lengthType: 'medium',
      dependencyTalent: 'Soul Link',
    ),
  ];
}

List<Widget> getDestructionArrowList() {
  return [
    ArrowWidget(
      startPosition: Position(row: 4, column: 1),
      endPosition: Position(row: 5, column: 1),
      lengthType: 'short',
      dependencyTalent: 'Pyroclasm',
    ),
    ArrowWidget(
      startPosition: Position(row: 3, column: 3),
      endPosition: Position(row: 5, column: 3),
      lengthType: 'medium',
      dependencyTalent: 'Ruin',
    ),
    ArrowWidget(
      startPosition: Position(row: 5, column: 2),
      endPosition: Position(row: 7, column: 2),
      lengthType: 'medium',
      dependencyTalent: 'Conflagrate',
    ),
  ];
}
// List<Widget> afflictionArrowList = [
//   ArrowWidget(
//     startPosition: Position(row: 3, column: 3),
//     endPosition: Position(row: 5, column: 3),
//     lengthType: 'medium',
//     dependencyTalent: '',
//     talentList: ,
//   ),
//   ArrowWidget(
//     startPosition: Position(row: 5, column: 2),
//     endPosition: Position(row: 6, column: 2),
//     lengthType: 'short',
//   ),
//   RightArrowWidget(
//     startPosition: Position(row: 5, column: 3),
//     endPosition: Position(row: 5, column: 4),
//     lengthType: 'short',
//   ),
// ];

// List<Widget> demonologyArrowList = [
//   ArrowWidget(
//     startPosition: Position(row: 3, column: 2),
//     endPosition: Position(row: 4, column: 2),
//     lengthType: 'short',
//   ),
//   ArrowWidget(
//     startPosition: Position(row: 4, column: 3),
//     endPosition: Position(row: 6, column: 3),
//     lengthType: 'medium',
//   ),
//   ArrowWidget(
//     startPosition: Position(row: 5, column: 2),
//     endPosition: Position(row: 7, column: 2),
//     lengthType: 'medium',
//   ),
// ];

// List<Widget> destructionArrowList = [
//   ArrowWidget(
//     startPosition: Position(row: 4, column: 1),
//     endPosition: Position(row: 5, column: 1),
//     lengthType: 'short',
//   ),
//   ArrowWidget(
//     startPosition: Position(row: 3, column: 3),
//     endPosition: Position(row: 5, column: 3),
//     lengthType: 'medium',
//   ),
//   ArrowWidget(
//     startPosition: Position(row: 5, column: 2),
//     endPosition: Position(row: 7, column: 2),
//     lengthType: 'medium',
//   ),
// ];
