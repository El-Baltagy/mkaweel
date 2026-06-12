

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/app/app.dart';
import 'package:mkaweel/localization.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: 'Main Navigator');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CodegenLoader.init();
  AppLocator().init();
   runApp(

    EasyLocalization(
      supportedLocales: CodegenLoader.supportedLocales,
      fallbackLocale: CodegenLoader.fallBackLocale,
      path: CodegenLoader.assetTranslationsPath,
      assetLoader: CodegenLoader(),
      child: const MyApp(),
    ),
  );
}


//flutter pub run custom_lint