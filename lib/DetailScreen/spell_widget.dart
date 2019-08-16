import 'package:flutter/material.dart';

class SpellWidget extends StatelessWidget {
  final String imgLocation;
  SpellWidget({@required this.imgLocation});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(imgLocation));
  }
}
