import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: DetailScreen(),
      // home: MyImageApp(),
    );
  }
}

class MyImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image from assets"),
        ),
        body: Image.asset('assets/Warlock/Affliction.png'), //   <--- image here
      ),
    );
  }
}
