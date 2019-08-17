import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/arrow_widget.dart';
import 'package:wow_classic_talent_calculator/model/position.dart';

List<Widget> afflictionArrowList = [
  ArrowWidget(
    startPosition: Position(row: 3, column: 3),
    endPosition: Position(row: 5, column: 3),
    lengthType: 'medium',
  ),
  ArrowWidget(
    startPosition: Position(row: 5, column: 2),
    endPosition: Position(row: 6, column: 2),
    lengthType: 'short',
  ),
  RightArrowWidget(
    startPosition: Position(row: 5, column: 3),
    endPosition: Position(row: 5, column: 4),
    lengthType: 'short',
  ),
];

List<Widget> demonologyArrowList = [
  ArrowWidget(
    startPosition: Position(row: 3, column: 2),
    endPosition: Position(row: 4, column: 2),
    lengthType: 'short',
  ),
  ArrowWidget(
    startPosition: Position(row: 4, column: 3),
    endPosition: Position(row: 6, column: 3),
    lengthType: 'medium',
  ),
  ArrowWidget(
    startPosition: Position(row: 5, column: 2),
    endPosition: Position(row: 7, column: 2),
    lengthType: 'medium',
  ),
];

List<Widget> destructionArrowList = [
  ArrowWidget(
    startPosition: Position(row: 4, column: 1),
    endPosition: Position(row: 5, column: 1),
    lengthType: 'short',
  ),
  ArrowWidget(
    startPosition: Position(row: 3, column: 3),
    endPosition: Position(row: 5, column: 3),
    lengthType: 'medium',
  ),
  ArrowWidget(
    startPosition: Position(row: 5, column: 2),
    endPosition: Position(row: 7, column: 2),
    lengthType: 'medium',
  ),
];