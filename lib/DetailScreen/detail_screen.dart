import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen_content.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';

class DetailScreen extends StatelessWidget {
  final String className;
  final Color classColor;
  final Future<List> talentTrees;
  final List arrowTrees;
  DetailScreen(
      {this.className, this.classColor, this.talentTrees, this.arrowTrees});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: talentTrees,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          /// make new talent object every time we go to detail view
          TalentTrees talentTreesObject = TalentTrees.fromJson(snapshot.data);
          return ChangeNotifierProvider<TalentProvider>(
              builder: (_) => TalentProvider(talentTreesObject),
              child: DetailScreenContent(
                  className: className,
                  classColor: classColor,
                  talentTrees: talentTreesObject,
                  arrowTrees: arrowTrees));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
