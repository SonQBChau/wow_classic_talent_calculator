import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/class_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/warlock_arrow.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen_content.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/talent_tree_widget.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'dart:convert';
import 'package:wow_classic_talent_calculator/utils/constants.dart';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/size_config.dart';

class DetailScreen extends StatefulWidget {
  final String className;
  DetailScreen({this.className});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TalentTrees talentTrees;
  var arrowTrees;

  Future<String> loadJson() async {
    return await rootBundle.loadString('data_repo/${widget.className}.json');
  }

  ///parse json to object
  Future<TalentTrees> loadTalent() async {
    String jsonTalent = await loadJson();
    final jsonResponse = json.decode(jsonTalent);
    TalentTrees localSpecTreeList = TalentTrees.fromJson(jsonResponse);
    return localSpecTreeList;
  }

  Future _buildTalentList() async {
    TalentTrees loadedSpecTreeList = await loadTalent();
    setState(() {
      talentTrees = loadedSpecTreeList;
      arrowTrees = getArrowClassByName(widget.className);
    });
  }

  @override
  initState() {
    super.initState();
    _buildTalentList();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return talentTrees == null
        ? CircularProgressIndicator()
        : ChangeNotifierProvider<TalentProvider>(
            builder: (_) => TalentProvider(talentTrees),
            child: DetailScreenContent(
                className: widget.className,
                talentTrees: talentTrees,
                arrowTrees: arrowTrees));
  }
}
