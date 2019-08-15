import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:wow_classic_talent_calculator/model/talent.dart';


class DetailScreen extends StatelessWidget {
  SpecTreeList specTreeList;

  Future<String> loadAsset() async {
    return await rootBundle.loadString('data_repo/warlock_new.json');
  }

  Future printFuture() async {
    String jsonTalent = await loadAsset();
    final jsonResponse = json.decode(jsonTalent);
    specTreeList = SpecTreeList.fromJson(jsonResponse);
//    print(specTreeList.specTrees[0].name);
//    print(specTreeList.specTrees[1].name);
//    print(specTreeList.specTrees[2].name);
  }

  @override
  Widget build(BuildContext context) {
    print(specTreeList.specTrees[0]);

    return Scaffold(
        appBar: AppBar(
          title: Text('Card Details'),
          backgroundColor: Color(0xFF673AB7),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(100, (index) {
              return Center(
                child: Container(
                  margin: EdgeInsets.all(1),
                  color: Colors.grey,
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            }),
          ),
        ));
  }
}
