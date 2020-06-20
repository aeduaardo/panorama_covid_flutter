import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:covidapp_flutter/app/modules/home/home_controller.dart';
import 'package:covidapp_flutter/app/shared/repositories/data_repository.dart';

void main() {
  final HomeController controller = HomeController(DataRepository(Dio()));

  test('Validate function fetchData()', () async {
    await controller.fetchData(false);
    Completer();
    expect(controller.data.value.cases, equals(739503));
  });
}
