import 'package:core/config/app_config.dart';
import 'package:core/config/network/dio_config.dart';

import 'package:core/di/app_di.dart';
import 'package:firebase_core/firebase_core.dart';

import '../errors/error_handler.dart';
import '../providers/api_provider.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initDio();
    _initApi();
    _initFirebase();
  }

  void _initDio() {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );
  }

  void _initApi() {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );

    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        appLocator<DioConfig>().dio,
      ),
    );
  }

  void _initFirebase() async {
    appLocator.registerSingleton<FirebaseApp>(await Firebase.initializeApp());
  }
}
