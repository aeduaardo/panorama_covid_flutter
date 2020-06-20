import 'package:mobx/mobx.dart';
import 'package:covidapp_flutter/app/models/data_model.dart';
import 'package:covidapp_flutter/app/shared/config.dart';
import 'package:covidapp_flutter/app/shared/repositories/data_reposiroty_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IDataRepository _dataRepository;
  _HomeControllerBase(this._dataRepository) {
    fetchData(false, refresh: true);
    fetchData(true, refresh: true);
    data = nationalData;
  }

  @observable
  int currentIndex = 0;

  ObservableFuture<DataModel> nationalData;
  ObservableFuture<DataModel> worldData;

  @action
  void changePage(value) {
    if (value == 0) {
      data = nationalData;
    } else {
      data = worldData;
    }
    currentIndex = value;
  }

  @observable
  ObservableFuture<DataModel> data;

  @action
  Future fetchData(bool isCountries, {bool refresh = false}) async {
    if (refresh) {
      data = null;
      if (isCountries) {
        worldData = _dataRepository
            .getData(
                countries: isCountries,
                localStorage: ConfigDataBase.LOCAL_STORAGE)
            .asObservable();
        data = worldData;
      } else {
        nationalData = _dataRepository
            .getData(
                countries: isCountries,
                localStorage: ConfigDataBase.LOCAL_STORAGE)
            .asObservable();
        data = nationalData;
      }
    }
  }
}
