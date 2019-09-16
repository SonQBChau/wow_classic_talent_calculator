import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/home_screen.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/load_home_screen.dart';
import 'package:wow_classic_talent_calculator/IntroScreen/card_widget.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
import 'package:wow_classic_talent_calculator/utils/fade_transition.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // image size
      height: 330,
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/background/paper.png',
            fit: BoxFit.contain,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardWidget(
                  icon: Icons.add_circle,
                  text: 'Tap to increase',
                ),
                SizedBox(
                  height: 20,
                ),
                CardWidget(
                  icon: Icons.remove_circle,
                  text: 'Double tap to decrease',
                ),
                SizedBox(
                  height: 20,
                ),
                CardWidget(
                  icon: Icons.info,
                  text: 'Hold for description',
                ),
              ],
            ),
          )
          // Column(
          //   children: <Widget>[
          //     SizedBox(
          //       height: 20,
          //     ),
          //     CardWidget(
          //       icon: Icons.add_circle,
          //       text: 'Tap to increase',
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     CardWidget(
          //       icon: Icons.remove_circle,
          //       text: 'Double tap to decrease',
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     CardWidget(
          //       icon: Icons.info,
          //       text: 'Hold for description',
          //     ),
          //   ],
          // )
        ],
      ),
    );

    ;
  }
}
