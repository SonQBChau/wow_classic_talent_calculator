class TalentTrees {
  final List<TalentTree> specTrees;

  TalentTrees({
    this.specTrees,
  });

  factory TalentTrees.fromJson(List<dynamic> parsedJson) {
    List<TalentTree> specTrees = new List<TalentTree>();
    specTrees = parsedJson.map((i) => TalentTree.fromJson(i)).toList();

    return new TalentTrees(specTrees: specTrees);
  }

  List<TalentTree> toJson() {
    return specTrees;
  }
}

class TalentTree {
  String name;
  String icon;
  String background;
  int points;
  Talents talents;

  TalentTree(
      {this.name, this.icon, this.background, this.points, this.talents});

  TalentTree.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    icon = json['Icon'];
    background = json['Background'];
    points = json['Points'];
    talents =
        json['Talents'] != null ? new Talents.fromJson(json['Talents']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Icon'] = this.icon;
    data['Background'] = this.background;
    data['Points'] = this.points;
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
  int points;
  String dependency;
  List<String> support;
  List<int> position;
  bool enable;
  int tier;
  Ranks ranks;

  Talent(
      {this.icon,
      this.name,
      this.points,
      this.dependency,
      this.support,
      this.position,
      this.enable,
      this.tier,
      this.ranks});

  Talent.fromJson(Map<String, dynamic> json) {
    icon = json['Icon'];
    name = json['Name'];
    points = json['Points'];
    dependency = json['Dependency'];
    support = json['Support'].cast<String>();
    position = json['Position'].cast<int>();
    enable = json['Enable'];
    tier = json['Tier'];
    ranks = json['Ranks'] != null ? new Ranks.fromJson(json['Ranks']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Icon'] = this.icon;
    data['Name'] = this.name;
    data['Points'] = this.points;
    data['Dependency'] = this.dependency;
    data['Support'] = this.support;
    data['Position'] = this.position;
    data['Enable'] = this.enable;
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
  int number;
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
