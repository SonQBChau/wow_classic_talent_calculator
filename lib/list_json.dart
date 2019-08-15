import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'model/spell.dart';
import 'model/talent.dart';

class ListJson extends StatelessWidget {
  // Future<String> loadAsset() async {
  //   return await rootBundle.loadString('data_repo/data.json');
  // }

  // Future printFuture() async {
  //   String jsonPhotos = await loadAsset();
  //   final jsonResponse = json.decode(jsonPhotos);
  //   SpellList photosList = SpellList.fromJson(jsonResponse);
  //   print("photos " + photosList.spells[0].birthYear);
  // }
  Future<String> loadAsset() async {
    return await rootBundle.loadString('data_repo/warlock.json');
  }

  Future printFuture() async {
    String jsonTalent = await loadAsset();
    final jsonResponse = json.decode(jsonTalent);
    TalentTreeList talentTreeList = TalentTreeList.fromJson(jsonResponse);
    print(talentTreeList.talentTrees[0].spec);
    print(talentTreeList.talentTrees[1].spec);
    print(talentTreeList.talentTrees[2].spec);
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
                future: rootBundle.loadString('data_repo/data.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var new_data = json.decode(snapshot.data.toString());

                  return ListView.builder(
                    // Build the ListView
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text("Name: " + new_data[index]['name']),
                            Text("Height: " + new_data[index]['height']),
                            Text("Mass: " + new_data[index]['mass']),
                            Text(
                                "Hair Color: " + new_data[index]['hair_color']),
                            Text(
                                "Skin Color: " + new_data[index]['skin_color']),
                            Text("Eye Color: " + new_data[index]['eye_color']),
                            Text(
                                "Birth Year: " + new_data[index]['birth_year']),
                            Text("Gender: " + new_data[index]['gender'])
                          ],
                        ),
                      );
                    },
                    itemCount: new_data == null ? 0 : new_data.length,
                  );
                }),
          ),
        ));
  }
}
