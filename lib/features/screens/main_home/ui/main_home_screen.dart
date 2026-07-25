import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/entrance_fader.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
import 'package:mkaweel/features/screens/main_home/controller/main_home_cubit.dart';
import 'package:mkaweel/features/screens/main_home/controller/main_home_state.dart';
import 'package:mkaweel/features/screens/settings/data/base_type_worker.dart';

part 'widgets/bottom_nav_bar.dart';



@RoutePage()
class MainHomePage extends StatefulWidget implements AutoRouteWrapper {
  const MainHomePage({super.key, required this.args});

  final MainHomeRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<MainHomeCubit>(
      create: (context) =>
          MainHomeCubit(AppLocator()()())..getProfileDataFunc(Init()),
      child: this,
    );
  }

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends MainHomePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<MainHomeCubit, MainHomeState, BaseEmit?>(
      selector: (state) =>
          state is MainHomeLoaded ? state.getProfileDataState : null,
      builder: (context, state) {
        // bool isLoading = state is Loading;
        if (state is ErrorState) {
          return buildError();
        }

        User? data = state is Success<User> ? state.data : null;
        if (data != null) {
          List<NavItemData> routesNav() {
            return data.role.toLowerCase().trim() != 'admin'
                ? BaseTypeAdmin.instance.buildRoutesNav()
                : BaseTypeWorker.instance.buildRoutesNav();
          }
          return AutoTabsScaffold(
            routes:   routesNav().map((e) => e.route).toList(),
            bottomNavigationBuilder: (context, tabsRouter) {
              return EntranceFader(
                  delay:const Duration(milliseconds: 500),
                  dx: 0,
                  dy: 32,
                  child: _BottomNavBar(tabsRouter: tabsRouter,routesNav:routesNav()));
            },
          );

        }
        return buildLoading();
      },
    );
  }

  Scaffold buildLoading() {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }

  Scaffold buildError() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Icon(
              Icons.refresh,
              color: context.theme.colorScheme.secondary,
              size: 30,
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: .center,
              children: [
                Text('please_try_again_later'.tr()),
                10.horizontalSpace,
                Icon(
                  Icons.error_outline,
                  color: context.theme.colorScheme.secondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

abstract class MainHomePageBaseState extends State<MainHomePage> {
  // late final MainHomeCubit argData;

  // @override
  // void initState() {
  //   super.initState();
  //   argData = MainHomeCubit.get(context: context);
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
