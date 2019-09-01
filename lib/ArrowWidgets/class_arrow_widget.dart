import 'package:wow_classic_talent_calculator/ArrowWidgets/druid_arrow.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/hunter_arrow.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/mage_arrow.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/paladin_arrow.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/priest_arrow.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/rogue_arrow.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/shaman_arrow.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/warlock_arrow.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/warrior_arrow.dart';

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
    case 'shaman':
      return getShamanArrowList();
      break;
    case 'warrior':
      return getWarriorArrowList();
      break;

    default:
      {
        //statements;
        return [[], [], []];
      }
      break;
  }
}
