import 'package:flutter/material.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  _handleOnTap(BuildContext context, String className) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(className: className),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WoW Classic Talent Calculator'),
          backgroundColor: Color(0xFF673AB7),
        ),
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () => _handleOnTap(context, 'warlock'),
              child: Container(
                height: 150,
                color: Colors.amber[600],
                child: const Center(child: Text('Warlock')),
              ),
            ),
            Container(
              height: 150,
              color: Colors.amber[500],
              child: const Center(child: Text('Warrior')),
            ),
            Container(
              height: 150,
              color: Colors.amber[100],
              child: const Center(child: Text('Priest')),
            ),
          ],
        ));
  }
}
