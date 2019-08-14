class Spell {
  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;

  Spell(
      {this.name,
      this.height,
      this.mass,
      this.hairColor,
      this.skinColor,
      this.eyeColor,
      this.birthYear,
      this.gender});

  Spell.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['height'] = this.height;
    data['mass'] = this.mass;
    data['hair_color'] = this.hairColor;
    data['skin_color'] = this.skinColor;
    data['eye_color'] = this.eyeColor;
    data['birth_year'] = this.birthYear;
    data['gender'] = this.gender;
    return data;
  }
}

class SpellList {
  final List<Spell> spells;

  SpellList({
    this.spells,
  });

  factory SpellList.fromJson(List<dynamic> parsedJson) {
    List<Spell> spells = new List<Spell>();
    spells = parsedJson.map((i) => Spell.fromJson(i)).toList();

    return new SpellList(spells: spells);
  }
}
