import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:wow_classic_talent_calculator/ClassArrow/class_arrow_widget.dart';
import 'package:wow_classic_talent_calculator/DetailScreen/detail_screen_content.dart';
import 'package:wow_classic_talent_calculator/provider/TalentProvider.dart';
import 'package:wow_classic_talent_calculator/utils/colors.dart';
import 'dart:convert';
import 'package:wow_classic_talent_calculator/model/talent.dart';
import 'package:wow_classic_talent_calculator/utils/string.dart' as str;

/// show a class talent with 3 tabs, each tab contains a spec tree
class DetailScreen extends StatefulWidget {
  final String className;
  final Color classColor;
  DetailScreen({this.className, this.classColor});

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
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // wait for talentTrees to load
    // show CircularProgressIndicator while loading
    // else show DetailScreen content
    return talentTrees == null
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                str.capitalize(widget.className),
                style: TextStyle(color: kColorSelectiveYellow),
              ),
              backgroundColor: kColorLightLicorice,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: kColorSelectiveYellow),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Center(child: CircularProgressIndicator()))
        : ChangeNotifierProvider<TalentProvider>(
            builder: (_) => TalentProvider(talentTrees),
            child: DetailScreenContent(
                className: widget.className,
                classColor: widget.classColor,
                talentTrees: talentTrees,
                arrowTrees: arrowTrees));
  }
}
