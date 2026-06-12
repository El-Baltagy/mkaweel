import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
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
    return BlocProvider<ThemeCubit>(
      create: (context) => AppLocator()()(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // locale: Locale(StorageHelper().readData('langCode')??"en"),
            title: 'Mkaweel',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}