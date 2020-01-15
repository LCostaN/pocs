import 'package:mobx/mobx.dart';
import 'package:mobx_poc/models/hero_model.dart';

part 'hero_store.g.dart';

class HeroStore = _HeroStore with _$HeroStore;

abstract class _HeroStore with Store {
  @observable
  HeroModel model = HeroModel(
    imageUrl:
        "https://raw.githubusercontent.com/mobxjs/mobx.dart/master/docs/src/images/mobx.png",
    name: "MOBX",
    power: "State Management",
  );

  @computed
  bool get isDead => model.hp <= 0;

  @observable
  List<String> log = ObservableList();

  @action
  void takeDamage(int damage) {
    model.hp -= damage;
    log.add("Taken -$damage damage. HP left: ${model.hp}");
    if (isDead) log.add("${model.name} hero is Dead!");

    return;
  }

  @action
  void reset() {
    model = HeroModel(
      imageUrl:
          "https://raw.githubusercontent.com/mobxjs/mobx.dart/master/docs/src/images/mobx.png",
      name: "MOBX",
      power: "State Management",
    );
    log = ObservableList();
  }
}
