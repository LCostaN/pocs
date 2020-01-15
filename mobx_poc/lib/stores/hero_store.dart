import 'package:mobx/mobx.dart';
import 'package:mobx_poc/models/hero_model.dart';

part 'hero_store.g.dart';

class HeroStore = _HeroStore with _$HeroStore;

abstract class _HeroStore with Store {
  @observable
  HeroModel data = HeroModel(
    imageUrl:
        "https://raw.githubusercontent.com/mobxjs/mobx.dart/master/docs/src/images/mobx.png",
    name: "MOBX",
    power: "State Management",
  );

  @computed
  bool get isDead => data.hp <= 0;

  @observable
  List<String> log = ObservableList();

  @action
  void takeDamage(int damage) {
    data.hp -= damage;
    log.add("Taken -$damage damage. HP left: ${data.hp}");
    if (isDead) log.add("${data.name} hero is Dead!");

    print(this.isDead);
    return;
  }

  @action
  void reset() {
    data = HeroModel(
      imageUrl:
          "https://raw.githubusercontent.com/mobxjs/mobx.dart/master/docs/src/images/mobx.png",
      name: "MOBX",
      power: "State Management",
    );
    log = ObservableList();
  }
}
