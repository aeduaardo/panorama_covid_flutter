import 'package:dio/dio.dart';
import 'package:covidapp_flutter/app/models/data_model.dart';
import 'package:covidapp_flutter/app/shared/repositories/data_reposiroty_interface.dart';
import 'package:covidapp_flutter/app/shared/repositories/test_data.dart';

class DataRepository extends IDataRepository {
  final Dio dio;
  DataRepository(this.dio);
  @override
  Future<DataModel> getData({bool countries, bool localStorage = false}) async {
    DataModel dataModel;
    try {
      if (!localStorage) {
        var response =
            countries ? await dio.get('world') : await dio.get('national');
        if (response.statusCode == 200) {
          dataModel = DataModel.fromJson(response.data);
        } else {
          return null;
        }
      } else {
        var response = countries ? TestData.world : TestData.nacional;
        if (response.isNotEmpty) {
          dataModel = DataModel.fromJson(response);
        } else {
          return null;
        }
      }
      return dataModel;
    } catch (e) {
      print('Error: ' + e.toString());
      return null;
    }
  }
}
