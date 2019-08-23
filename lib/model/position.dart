///User for arrow position on the screen
class Position {
  final int row;
  final int column;

  Position({
    int row,
    int column,
  })  : row = row + 1,
        column = column + 1;
}
