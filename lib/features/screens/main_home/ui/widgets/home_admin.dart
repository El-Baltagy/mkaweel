part of '../main_home_screen.dart';
class _HomeAdmin extends StatelessWidget {
  const _HomeAdmin({super.key  });
   @override
  Widget build(BuildContext context) {
    final List<_NavItemData> routesNav = [
      _NavItemData(icon: Icons.grid_view_rounded, route:   const DashboardRoute(),    label: 'home'.tr()),
      _NavItemData(icon: Icons.business_center_outlined,route:   const ProjectsRoute(), label: 'projects_tab'.tr()),
      _NavItemData(icon: Icons.trending_up_rounded, route:   const MarketPricesRoute(), label: 'prices_tab'.tr()),
      _NavItemData(icon: Icons.group_outlined, route:   const WorkersRoute(),       label: 'workers_tab'.tr()),
      _NavItemData(icon: Icons.settings_outlined,route:   const SettingsRoute(),     label: 'settings_tab'.tr()),
    ];
    return AutoTabsScaffold(
      routes:   routesNav.map((e) => e.route).toList(),
      bottomNavigationBuilder: (context, tabsRouter) {
        return _BottomNavBar(tabsRouter: tabsRouter,routesNav:routesNav);
      },
    );
  }
}
