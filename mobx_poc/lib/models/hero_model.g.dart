// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeroModel on _HeroModel, Store {
  final _$imageUrlAtom = Atom(name: '_HeroModel.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.context.enforceReadPolicy(_$imageUrlAtom);
    _$imageUrlAtom.reportObserved();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.context.conditionallyRunInAction(() {
      super.imageUrl = value;
      _$imageUrlAtom.reportChanged();
    }, _$imageUrlAtom, name: '${_$imageUrlAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_HeroModel.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$powerAtom = Atom(name: '_HeroModel.power');

  @override
  String get power {
    _$powerAtom.context.enforceReadPolicy(_$powerAtom);
    _$powerAtom.reportObserved();
    return super.power;
  }

  @override
  set power(String value) {
    _$powerAtom.context.conditionallyRunInAction(() {
      super.power = value;
      _$powerAtom.reportChanged();
    }, _$powerAtom, name: '${_$powerAtom.name}_set');
  }

  final _$hpAtom = Atom(name: '_HeroModel.hp');

  @override
  int get hp {
    _$hpAtom.context.enforceReadPolicy(_$hpAtom);
    _$hpAtom.reportObserved();
    return super.hp;
  }

  @override
  set hp(int value) {
    _$hpAtom.context.conditionallyRunInAction(() {
      super.hp = value;
      _$hpAtom.reportChanged();
    }, _$hpAtom, name: '${_$hpAtom.name}_set');
  }
}
