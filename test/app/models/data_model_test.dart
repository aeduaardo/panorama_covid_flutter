import 'package:flutter_test/flutter_test.dart';
import 'package:covidapp_flutter/app/models/data_model.dart';

void main() {
  var jsonData = {
    'cases': 10,
    'deaths': 11,
    'recovered': 12,
    'percentageInfected': 0.19
  };

  test('Validate Data Model', () async {
    DataModel data = DataModel.fromJson(jsonData);
    expect(data.percentageInfected, equals(0.19));
    expect(data.cases, equals(10));
    expect(data.deaths, equals(11));
    expect(data.recovered, equals(12));
  });
}
