import 'package:wow_classic_talent_calculator/ClassArrow/druid_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/hunter_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/mage_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/paladin_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/priest_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/rogue_arrow.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/warlock_arrow.dart';

getArrowClassByName(String className) {
  switch (className) {
    case 'warlock':
      return getWarlockArrowList();
      break;

    case 'druid':
      return getDruidArrowList();
      break;
    case 'hunter':
      return getHunterArrowList();
      break;
    case 'mage':
      return getMageArrowList();
      break;
    case 'paladin':
      return getPaladinArrowList();
      break;
    case 'priest':
      return getPriestArrowList();
      break;
    case 'rogue':
      return getRogueArrowList();
      break;

    default:
      {
        //statements;
        return [[], [], []];
      }
      break;
  }
}
