import 'package:covidapp_flutter/app/models/data_model.dart';

abstract class IDataRepository {
  Future<DataModel> getData({bool countries, bool localStorage = false});
}
