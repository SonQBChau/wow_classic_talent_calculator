import 'package:flutter/material.dart';

class SpellGridWidget extends StatelessWidget {
  final List<Widget> specWidgetList;
  SpellGridWidget({@required this.specWidgetList});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: specWidgetList,
    );
  }
}
