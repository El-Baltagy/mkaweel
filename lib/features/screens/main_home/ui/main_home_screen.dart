import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/main_home/controller/main_home_cubit.dart';
import 'package:mkaweel/features/screens/main_home/controller/main_home_state.dart';
part 'widgets/bottom_nav_bar.dart';



@RoutePage()
class MainHomePage extends StatefulWidget implements AutoRouteWrapper {
  final MainHomeRouteArgs args;
  
  const MainHomePage({super.key, required this.args});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<MainHomeCubit>(
      create: (context) => MainHomeCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends MainHomePageBaseState {
  @override
  Widget build(BuildContext context) {
    final List<_NavItemData> routesNav = [
      _NavItemData(icon: Icons.grid_view_rounded, route:   const DashboardRoute(),    label: 'home'.tr()),
      _NavItemData(icon: Icons.business_center_outlined,route:   const ProjectsRoute(), label: 'projects_tab'.tr()),
      _NavItemData(icon: Icons.trending_up_rounded, route:   const MarketPricesRoute(), label: 'prices_tab'.tr()),
      _NavItemData(icon: Icons.group_outlined, route:   const WorkersRoute(),       label: 'workers_tab'.tr()),
      _NavItemData(icon: Icons.settings_outlined,route:   const SettingsRoute(),     label: 'settings_tab'.tr()),
    ];

    return BlocListener<MainHomeCubit, MainHomeState>(
      listener: (context, state) {},
      child: AutoTabsScaffold(
        routes:   routesNav.map((e) => e.route).toList(),
        bottomNavigationBuilder: (context, tabsRouter) {
          return _BottomNavBar(tabsRouter: tabsRouter,routesNav:routesNav);
        },
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
