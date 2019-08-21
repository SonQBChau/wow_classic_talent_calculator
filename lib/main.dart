import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

import 'DetailScreen/detail_screen.dart';
import 'HomeScreen/home_screen.dart';
import 'list_json.dart';

void main() => runApp(MyApp());

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
      // home: DetailScreen(),
      home: HomeScreen(),
    );
  }
}
