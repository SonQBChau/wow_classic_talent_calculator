// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wow_classic_talent_calculator/HomeScreen/home_screen.dart';
// import 'package:wow_classic_talent_calculator/HomeScreen/load_home_screen.dart';
// import 'package:wow_classic_talent_calculator/IntroScreen/intro_screen.dart';

// import 'package:wow_classic_talent_calculator/utils/fade_transition.dart';

// /// First page of the app
// /// First time running, show onboarding page by checking shared preferences
// /// for normal log in, show Home page

// class WelcomeScreen extends StatefulWidget {
//   @override
//   WelcomeScreenState createState() => WelcomeScreenState();
// }

// class WelcomeScreenState extends State<WelcomeScreen> {
//   Future checkFirstSeen() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool _seen = (prefs.getBool('seenOnboarding') ?? false);

//     if (_seen) {
//       // Navigator.of(context).pushReplacement(
//       // MaterialPageRoute(builder: (context) => HomeScreen()));
//       Navigator.of(context).pushReplacement(FadeRoute(page: LoadHomeScreen()));
//     } else {
//       prefs.setBool('seenOnboarding', true);
//       // Navigator.of(context).pushReplacement(
//       //     MaterialPageRoute(builder: (context) => IntroScreen()));
//       Navigator.of(context).pushReplacement(FadeRoute(page: IntroScreen()));
//     }
//   }

//   @override
//   Future initState() {
//     super.initState();
//     checkFirstSeen();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           // child: Text('Loading...'),
//           ),
//     );
//   }
// }
