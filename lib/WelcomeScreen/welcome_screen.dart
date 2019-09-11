import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/home_screen.dart';
import 'package:wow_classic_talent_calculator/HomeScreen/load_home_screen.dart';
import 'package:wow_classic_talent_calculator/IntroScreen/intro_screen.dart';
import 'package:wow_classic_talent_calculator/model/user.dart';
import 'package:wow_classic_talent_calculator/services/localstorage_service.dart';
import 'package:wow_classic_talent_calculator/services/service_locator.dart';
import 'package:wow_classic_talent_calculator/utils/fade_transition.dart';

/// First page of the app
/// First time running, show onboarding page by checking shared preferences
/// for normal log in, show Home page

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      // Navigator.of(context).pushReplacement(
      // MaterialPageRoute(builder: (context) => HomeScreen()));
      Navigator.of(context).pushReplacement(FadeRoute(page: LoadHomeScreen()));
    } else {
      prefs.setBool('seen', true);
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => IntroScreen()));
      Navigator.of(context).pushReplacement(FadeRoute(page: IntroScreen()));
    }
  }

  Future getUserPreferences() async {
    var storageService = sl.get<LocalStorageService>();
    var mySavedUser = storageService.user;
    print('==============');
    print(storageService);
    print(mySavedUser);
  }

  @override
  Future initState() {
    super.initState();
    // checkFirstSeen();
    getUserPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // child: Text('Loading...'),
          ),
    );
  }
}
