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

  Future<String> loadJson() async {
    return await rootBundle.loadString('data_repo/warlock_new.json');
  }

  Future loadTalent() async {
    String jsonTalent = await loadJson();
    final jsonResponse = json.decode(jsonTalent);
    SpecTreeList parsedData = SpecTreeList.fromJson(jsonResponse);

    setState(() {
      specTreeList = parsedData;
    });

    // return parsedData;

    // print(specTreeList.specTrees[0].name);
//    print(specTreeList.specTrees[1].name);
//    print(specTreeList.specTrees[2].name);
  }

  @override
  initState() {
    super.initState();
    loadTalent();
    // loadTalent().then((result) {
    //   setState(() {
    //     specTreeList = result;
    //   });
    // });
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
            children: List.generate(100, (index) {
              return BlockTile();
            }),
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
