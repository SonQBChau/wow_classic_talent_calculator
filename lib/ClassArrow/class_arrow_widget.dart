import 'package:wow_classic_talent_calculator/ClassArrow/warlock_arrow.dart';

getArrowClassByName(String className) {
  switch (className) {
    case 'warlock':
      {
        // statements;
        return [
          getAfflictionArrowList(),
          getDemonologyArrowList(),
          getDestructionArrowList(),
        ];
      }
      break;

    case 'warrior':
      {
        //statements;
      }
      break;

    default:
      {
        //statements;
        return [ getAfflictionArrowList(),
          getDemonologyArrowList(),
          getDestructionArrowList(),];
      }
      break;
  }
}
