import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/home_screen.dart';
import 'package:wow_classic_talent_calculator/IntroScreen/card_widget.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kColorSelectiveYellow.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: <Widget>[
                 CardWidget(icon: Icons.add_circle,text: 'Tap to increase',),
                    SizedBox(height: 20,),
                    CardWidget(icon: Icons.remove_circle,text: 'Double tap to decrease',),
                    SizedBox(height: 20,),
                    CardWidget(icon: Icons.info,text: 'Hold for description',),
                    SizedBox(height: 20,),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              MaterialButton(
                child: Text('Got it!',
                  style: TextStyle(
                      fontSize: 30,
                      color: kColorLicorice
                  ),
                ),
                onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
