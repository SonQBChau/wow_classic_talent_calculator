class TalentTree {
  String spec;
  String icon;
  String bgImg;
  List<Spells> spells;

  TalentTree({this.spec, this.icon, this.bgImg, this.spells});

  TalentTree.fromJson(Map<String, dynamic> json) {
    spec = json['spec'];
    icon = json['icon'];
    bgImg = json['bg_img'];
    if (json['spells'] != null) {
      spells = new List<Spells>();
      json['spells'].forEach((v) {
        spells.add(new Spells.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spec'] = this.spec;
    data['icon'] = this.icon;
    data['bg_img'] = this.bgImg;
    if (this.spells != null) {
      data['spells'] = this.spells.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TalentTreeList {
  final List<TalentTree> talentTrees;

  TalentTreeList({
    this.talentTrees,
  });

  factory TalentTreeList.fromJson(List<dynamic> parsedJson) {
    List<TalentTree> talentTrees = new List<TalentTree>();
    talentTrees = parsedJson.map((i) => TalentTree.fromJson(i)).toList();

    return new TalentTreeList(talentTrees: talentTrees);
  }
}

class Spells {
  String name;
  String icon;
  String description;
  int maxRank;
  int requiredPoint;
  String requiredSpell;
  int row;
  int column;

  Spells(
      {this.name,
      this.icon,
      this.description,
      this.maxRank,
      this.requiredPoint,
      this.requiredSpell,
      this.row,
      this.column});

  Spells.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
    maxRank = json['max_rank'];
    requiredPoint = json['required_point'];
    requiredSpell = json['required_spell'];
    row = json['row'];
    column = json['column'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['description'] = this.description;
    data['max_rank'] = this.maxRank;
    data['required_point'] = this.requiredPoint;
    data['required_spell'] = this.requiredSpell;
    data['row'] = this.row;
    data['column'] = this.column;
    return data;
  }
}
