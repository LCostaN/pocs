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

  final _$modelAtom = Atom(name: '_HeroStore.model');

  @override
  HeroModel get model {
    _$modelAtom.context.enforceReadPolicy(_$modelAtom);
    _$modelAtom.reportObserved();
    return super.model;
  }

  @override
  set model(HeroModel value) {
    _$modelAtom.context.conditionallyRunInAction(() {
      super.model = value;
      _$modelAtom.reportChanged();
    }, _$modelAtom, name: '${_$modelAtom.name}_set');
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
