import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/core/theming/app_theme.dart';
import 'package:mkaweel/core/theming/theme_cubit.dart';
import 'package:mkaweel/main.dart';

final appRouter = AppRouter(navigatorKey: navigatorKey);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // TODO: implement dispose
    StorageHelper().closeBox();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      key: Key(context.locale.languageCode),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Mkaweel',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter.config(),
    );
  }
}