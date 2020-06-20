import 'package:mobx/mobx.dart';

part 'custom_list_controller.g.dart';

class CustomListController = _CustomListControllerBase
    with _$CustomListController;

abstract class _CustomListControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
