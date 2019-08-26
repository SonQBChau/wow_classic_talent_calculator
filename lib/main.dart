import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/IntroScreen/intro_screen.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
import 'package:wow_classic_talent_calculator/utils/fade_transition.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

import 'DetailScreen/detail_screen.dart';
import 'HomeScreen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// onboarding page
///https://stackoverflow.com/questions/50654195/flutter-one-time-intro-screen

Future main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}
// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WoW Classic Talent Calculator',
      theme: ThemeData(
//        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // home: IntroScreen(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      // Navigator.of(context).pushReplacement(
      // MaterialPageRoute(builder: (context) => HomeScreen()));
      Navigator.of(context).pushReplacement(FadeRoute(page: HomeScreen()));
    } else {
      prefs.setBool('seen', true);
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => IntroScreen()));
      Navigator.of(context).pushReplacement(FadeRoute(page: IntroScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
