import 'package:dio/dio.dart';
import 'package:covidapp_flutter/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:covidapp_flutter/app/app_widget.dart';
import 'package:covidapp_flutter/app/modules/home/home_module.dart';
import 'package:covidapp_flutter/app/modules/splash_screen/splash_screen_module.dart';
import 'package:covidapp_flutter/app/shared/api_url.dart';
import 'package:covidapp_flutter/app/shared/repositories/data_repository.dart';

import 'modules/home/components/custom_drawer/pages/info_data/info_data_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => DataRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: ApiUrl.BASE_URL))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: SplashScreenModule()),
        Router('/home', module: HomeModule()),
        Router('/info', child: (_, args) => InfoDataPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
