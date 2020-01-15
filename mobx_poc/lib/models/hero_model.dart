class HeroModel {
  String imageUrl;
  String name;
  String power;
  int hp = 100;

  HeroModel({
    this.imageUrl,
    this.name,
    this.power,
  });

  @override
  bool operator ==(Object other) =>
      other is HeroModel &&
      name == other.name &&
      imageUrl == other.imageUrl &&
      power == other.power && 
      hp == other.hp;

  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return "HeroModel... HP: $hp";
  }
}
