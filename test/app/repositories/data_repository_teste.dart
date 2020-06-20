import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:covidapp_flutter/app/models/data_model.dart';
import 'package:covidapp_flutter/app/shared/repositories/data_repository.dart';

void main() {
  final DataRepository _repository = DataRepository(Dio());

  test('Validate function getData()', () async {
    DataModel data = await _repository.getData(countries: true);
    expect(data.cases, 7172874);
    expect(data.arrayData[0].name, 'Estados Unidos');
    expect(data.arrayData[0].cases, 2016248);
  });
}
