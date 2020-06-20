import 'package:mobx/mobx.dart';

part 'info_data_controller.g.dart';

class InfoDataController = _InfoDataControllerBase with _$InfoDataController;

abstract class _InfoDataControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
