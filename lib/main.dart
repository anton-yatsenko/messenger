import 'package:core/di/app_di.dart';
import 'package:core/di/data_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dataDI.initDependencies();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('ru', 'RU'),
      Locale('en', 'US'),
    ],
    path: 'core/resources',
    fallbackLocale: const Locale('ru', 'RU'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = appLocator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
