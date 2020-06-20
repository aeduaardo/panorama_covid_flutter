// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_drawer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomDrawerController on _CustomDrawerControllerBase, Store {
  final _$valueAtom = Atom(name: '_CustomDrawerControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_CustomDrawerControllerBaseActionController =
      ActionController(name: '_CustomDrawerControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CustomDrawerControllerBaseActionController
        .startAction(name: '_CustomDrawerControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CustomDrawerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
