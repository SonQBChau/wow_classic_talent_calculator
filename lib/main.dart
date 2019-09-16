import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'WelcomeScreen/welcome_screen.dart';

/// onboarding page
///https://stackoverflow.com/questions/50654195/flutter-one-time-intro-screen

/// lock portrait mode
Future main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}
// void main() {
//   setupLocator();
//   runApp(MyApp());
// }

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
      home: WelcomeScreen(),
      // home: IntroScreen(),
    );
  }
}
