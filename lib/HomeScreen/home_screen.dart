import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/class_widget.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

/// Main Home Page, show for normal log in
class HomeScreen extends StatelessWidget {
  /// open class talents
  _handleOnTap(BuildContext context, String className, Color classColor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailScreen(className: className, classColor: classColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //home_screen is the first page render that can calculate screen size
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
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
              onTap: () => _handleOnTap(context, 'druid', kColorOrangeDruid),
              child: ClassWidget(
                className: 'druid',
              ),
            ),
            GestureDetector(
              onTap: () => _handleOnTap(context, 'hunter', kColorGreenHunter),
              child: ClassWidget(
                className: 'hunter',
              ),
            ),
            GestureDetector(
              onTap: () => _handleOnTap(context, 'mage', kColorBlueMage),
              child: ClassWidget(
                className: 'mage',
              ),
            ),
            GestureDetector(
              onTap: () => _handleOnTap(context, 'paladin', kColorPinkPaladin),
              child: ClassWidget(
                className: 'paladin',
              ),
            ),
            GestureDetector(
              onTap: () => _handleOnTap(context, 'priest', kColorWhitePriest),
              child: ClassWidget(
                className: 'priest',
              ),
            ),
            GestureDetector(
              onTap: () => _handleOnTap(context, 'rogue', kColorYellowRogue),
              child: ClassWidget(
                className: 'rogue',
              ),
            ),
            GestureDetector(
              onTap: () => _handleOnTap(context, 'shaman', kColorBlueShaman),
              child: ClassWidget(
                className: 'shaman',
              ),
            ),
            GestureDetector(
              onTap: () =>
                  _handleOnTap(context, 'warlock', kColorPurpleWarlock),
              child: ClassWidget(
                className: 'warlock',
              ),
            ),
            GestureDetector(
              onTap: () => _handleOnTap(context, 'warrior', kColorTanWarrior),
              child: ClassWidget(
                className: 'warrior',
              ),
            ),
          ],
        ));
  }
}
