// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeroStore on _HeroStore, Store {
  Computed<bool> _$isDeadComputed;

  @override
  bool get isDead =>
      (_$isDeadComputed ??= Computed<bool>(() => super.isDead)).value;

  final _$dataAtom = Atom(name: '_HeroStore.data');

  @override
  HeroModel get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(HeroModel value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$logAtom = Atom(name: '_HeroStore.log');

  @override
  List<String> get log {
    _$logAtom.context.enforceReadPolicy(_$logAtom);
    _$logAtom.reportObserved();
    return super.log;
  }

  @override
  set log(List<String> value) {
    _$logAtom.context.conditionallyRunInAction(() {
      super.log = value;
      _$logAtom.reportChanged();
    }, _$logAtom, name: '${_$logAtom.name}_set');
  }

  final _$_HeroStoreActionController = ActionController(name: '_HeroStore');

  @override
  void takeDamage(int damage) {
    final _$actionInfo = _$_HeroStoreActionController.startAction();
    try {
      return super.takeDamage(damage);
    } finally {
      _$_HeroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_HeroStoreActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$_HeroStoreActionController.endAction(_$actionInfo);
    }
  }
}
