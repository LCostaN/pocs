import 'package:mobx/mobx.dart';

part 'hero_model.g.dart';

class HeroModel = _HeroModel with _$HeroModel;

abstract class _HeroModel with Store {
  @observable
  String imageUrl;
  @observable
  String name;
  @observable
  String power;
  @observable
  int hp = 100;

  _HeroModel({
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
    return "Hero: $name  Power: $power  HP: $hp";
  }
}
