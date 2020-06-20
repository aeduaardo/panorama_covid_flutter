import 'package:mobx/mobx.dart';

part 'custom_drawer_controller.g.dart';

class CustomDrawerController = _CustomDrawerControllerBase
    with _$CustomDrawerController;

abstract class _CustomDrawerControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
