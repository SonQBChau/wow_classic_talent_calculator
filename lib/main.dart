import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:wow_classic_talent_calculator/services/localstorage_service.dart';
import 'package:wow_classic_talent_calculator/services/service_locator.dart';
import 'WelcomeScreen/welcome_screen.dart';
import 'model/user.dart';

/// onboarding page
///https://stackoverflow.com/questions/50654195/flutter-one-time-intro-screen

// GetIt getIt = GetIt.instance;

/// lock portrait mode
Future main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    setupLocator();
    // var instance = await LocalStorageService.getInstance();
    // getIt.registerSingleton<LocalStorageService>(instance);
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
