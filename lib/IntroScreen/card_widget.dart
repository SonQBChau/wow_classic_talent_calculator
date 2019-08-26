import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  CardWidget({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  icon,
                  size: 50,
                  color: kColorLightLicorice,
                )),
            Text(
              text,
              style: TextStyle(fontSize: 18, color: kColorLicorice),
            )
          ],
        ),
      ),
    );
  }
}
