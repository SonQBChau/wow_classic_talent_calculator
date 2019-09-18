import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/ArrowWidgets/class_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/class_widget.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/drawer_widget.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

/// Main Home Page, show for normal log in
class HomeScreen extends StatelessWidget {
  final Future<List> druidTalentTrees;
  final Future<List> hunterTalentTrees;
  final Future<List> mageTalentTrees;
  final Future<List> paladinTalentTrees;
  final Future<List> priestTalentTrees;
  final Future<List> rogueTalentTrees;
  final Future<List> shamanTalentTrees;
  final Future<List> warlockTalentTrees;
  final Future<List> warriorTalentTrees;

  HomeScreen(
      {this.druidTalentTrees,
      this.hunterTalentTrees,
      this.mageTalentTrees,
      this.paladinTalentTrees,
      this.priestTalentTrees,
      this.rogueTalentTrees,
      this.shamanTalentTrees,
      this.warlockTalentTrees,
      this.warriorTalentTrees});

  /// open class talents
  _handleOnTap(BuildContext context, String className, Future<List> talentTrees,
      Color classColor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          className: className,
          classColor: classColor,
          talentTrees: talentTrees,
          arrowTrees: getArrowClassByName(className),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //home_screen is the first page render that can calculate screen size
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kColorSelectiveYellow),
        title: Text(
          'Classic Talent Calculator',
          style: TextStyle(
            color: kColorSelectiveYellow,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: kColorLightLicorice,
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () => _handleOnTap(
                context, 'druid', druidTalentTrees, kColorOrangeDruid),
            child: ClassWidget(
              className: 'druid',
            ),
          ),
          GestureDetector(
            onTap: () => _handleOnTap(
                context, 'hunter', hunterTalentTrees, kColorGreenHunter),
            child: ClassWidget(
              className: 'hunter',
            ),
          ),
          GestureDetector(
            onTap: () =>
                _handleOnTap(context, 'mage', mageTalentTrees, kColorBlueMage),
            child: ClassWidget(
              className: 'mage',
            ),
          ),
          GestureDetector(
            onTap: () => _handleOnTap(
                context, 'paladin', paladinTalentTrees, kColorPinkPaladin),
            child: ClassWidget(
              className: 'paladin',
            ),
          ),
          GestureDetector(
            onTap: () => _handleOnTap(
                context, 'priest', priestTalentTrees, kColorWhitePriest),
            child: ClassWidget(
              className: 'priest',
            ),
          ),
          GestureDetector(
            onTap: () => _handleOnTap(
                context, 'rogue', rogueTalentTrees, kColorYellowRogue),
            child: ClassWidget(
              className: 'rogue',
            ),
          ),
          GestureDetector(
            onTap: () => _handleOnTap(
                context, 'shaman', shamanTalentTrees, kColorBlueShaman),
            child: ClassWidget(
              className: 'shaman',
            ),
          ),
          GestureDetector(
            onTap: () => _handleOnTap(
                context, 'warlock', warlockTalentTrees, kColorPurpleWarlock),
            child: ClassWidget(
              className: 'warlock',
            ),
          ),
          GestureDetector(
            onTap: () => _handleOnTap(
                context, 'warrior', warriorTalentTrees, kColorTanWarrior),
            child: ClassWidget(
              className: 'warrior',
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}
