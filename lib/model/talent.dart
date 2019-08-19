class SpecTreeList {
  final List<SpecTree> specTrees;

  SpecTreeList({
    this.specTrees,
  });

  factory SpecTreeList.fromJson(List<dynamic> parsedJson) {
    List<SpecTree> specTrees = new List<SpecTree>();
    specTrees = parsedJson.map((i) => SpecTree.fromJson(i)).toList();

    return new SpecTreeList(specTrees: specTrees);
  }
}

class SpecTree {
  String name;
  Talents talents;

  SpecTree({this.name, this.talents});

  SpecTree.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    talents =
    json['Talents'] != null ? new Talents.fromJson(json['Talents']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    if (this.talents != null) {
      data['Talents'] = this.talents.toJson();
    }
    return data;
  }
}



class Talents {
  List<Talent> talent;

  Talents({this.talent});

  Talents.fromJson(Map<String, dynamic> json) {
    if (json['Talent'] != null) {
      talent = new List<Talent>();
      json['Talent'].forEach((v) {
        talent.add(new Talent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.talent != null) {
      data['Talent'] = this.talent.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Talent {
  String icon;
  String name;
  String points;
  String dependency;
  List<int> position;
  String tier;
  Ranks ranks;

  Talent(
      {this.icon,
        this.name,
        this.points,
        this.dependency,
        this.position,
        this.tier,
        this.ranks});

  Talent.fromJson(Map<String, dynamic> json) {
    icon = json['Icon'];
    name = json['Name'];
    points = json['Points'];
    dependency = json['Dependency'];
    position = json['Position'].cast<int>();
    tier = json['Tier'];
    ranks = json['Ranks'] != null ? new Ranks.fromJson(json['Ranks']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Icon'] = this.icon;
    data['Name'] = this.name;
    data['Points'] = this.points;
    data['Dependency'] = this.dependency;
    data['Position'] = this.position;
    data['Tier'] = this.tier;
    if (this.ranks != null) {
      data['Ranks'] = this.ranks.toJson();
    }
    return data;
  }

}

class Ranks {
  List<Rank> rank;

  Ranks({this.rank});

  Ranks.fromJson(Map<String, dynamic> json) {
    if (json['Rank'] != null) {
      rank = new List<Rank>();
      json['Rank'].forEach((v) {
        rank.add(new Rank.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rank != null) {
      data['Rank'] = this.rank.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rank {
  String number;
  String description;

  Rank({this.number, this.description});

  Rank.fromJson(Map<String, dynamic> json) {
    number = json['Number'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Number'] = this.number;
    data['Description'] = this.description;
    return data;
  }
}