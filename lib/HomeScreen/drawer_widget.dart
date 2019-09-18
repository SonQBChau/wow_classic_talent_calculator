import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isSwitched;
  SharedPreferences prefs;

  Future loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    bool val = prefs.getBool('maxIncreaseOnTap') ?? true;
    setState(() {
      isSwitched = val;
    });
  }

  void handleOnSwitch(value) {
    setState(() {
      isSwitched = value;
    });
    // save to storage
    prefs.setBool('maxIncreaseOnTap', value);
  }

  Widget _buildSwitch() {
    if (isSwitched != null) {
      return Container(
        // width: 30,
        child: Switch(
            value: isSwitched,
            onChanged: (value) {
              handleOnSwitch(value);
            },
            activeTrackColor: kColorSelectiveYellow.withOpacity(0.5),
            activeColor: kColorSelectiveYellow,
            inactiveThumbColor: kColorSelectiveYellow.withOpacity(0.5)),
      );
    } else {
      return Container();
    }
  }

  @override
  initState() {
    super.initState();
    loadSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        color: kColorLightLicorice,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Text(
              'Settings',
              style: TextStyle(
                color: kColorSelectiveYellow,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Max points on tap',
                  style: TextStyle(
                    color: kColorSelectiveYellow,
                    fontSize: 16,
                  ),
                ),
                _buildSwitch(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
