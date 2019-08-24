import 'package:wow_classic_talent_calculator/ClassArrow/druid_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/hunter_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/mage_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/warlock_arrow.dart';

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
    case 'hunter':
      {
        return getHunterArrowList();
      }
      break;
    case 'mage':
      {
        return getMageArrowList();
      }
      break;

    default:
      {
        //statements;
        return [
          [],
          [],
          []
        ];
      }
      break;
  }
}



