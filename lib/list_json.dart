import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'model/spell.dart';
import 'model/talent.dart';

class ListJson extends StatelessWidget {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('data_repo/warlock_new.json');
  }

  Future printFuture() async {
    String jsonTalent = await loadAsset();
    final jsonResponse = json.decode(jsonTalent);
    SpecTreeList specTreeList = SpecTreeList.fromJson(jsonResponse);
    // print(specTreeList.specTrees[0].name);
    // print(specTreeList.specTrees[1].name);
    // print(specTreeList.specTrees[2].name);
  }

  Future<SpecTree> loadSpecTreeOne() async {
    String jsonTalent = await loadAsset();
    final jsonResponse = json.decode(jsonTalent);
    SpecTreeList specTreeList = SpecTreeList.fromJson(jsonResponse);
    print(specTreeList.specTrees[0]);
    return specTreeList.specTrees[0];
  }

  @override
  Widget build(BuildContext context) {
    printFuture();
    return Scaffold(
        appBar: AppBar(
          title: Text("Load local JSON file"),
        ),
        body: Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: FutureBuilder(
                future: loadSpecTreeOne(),
                builder:
                    (BuildContext context, AsyncSnapshot<SpecTree> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return CircularProgressIndicator();

                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        var specTree = snapshot.data;

                        return ListView.builder(
                            itemCount: specTree.talents.talent.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                    Text("Name: " +
                                        specTree.talents.talent[index].name),
                                  ]));
                            });
                      }
                  }
                }),
          ),
        ));
  }
}
