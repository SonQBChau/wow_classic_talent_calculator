import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:wow_classic_talent_calculator/model/talent.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  SpecTreeList specTreeList;
  List<Widget> talentList = [];

  Future<String> loadJson() async {
    return await rootBundle.loadString('data_repo/warlock_new.json');
  }

  Future<SpecTreeList> loadTalent() async {
    String jsonTalent = await loadJson();
    final jsonResponse = json.decode(jsonTalent);
    SpecTreeList parsedData = SpecTreeList.fromJson(jsonResponse);

    return parsedData;
  }

  Future buildTalentList() async {
    final children = <Widget>[];
    SpecTreeList specTreeList = await loadTalent();
    List<Talent> talentList = specTreeList.specTrees[0].talents.talent;
    for (var i = 0; i < talentList.length; i++) {
      children.add(Text(talentList[i].name));
    }
    return children;
  }

  @override
  initState() {
    super.initState();
    buildTalentList().then((result) {
      setState(() {
        talentList = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (specTreeList != null) {
      print(specTreeList.specTrees[0]);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Card Details'),
          backgroundColor: Color(0xFF673AB7),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 4,
            children: talentList,
          ),
        ));
  }
}

class BlockTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(1),
        color: Colors.grey,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
