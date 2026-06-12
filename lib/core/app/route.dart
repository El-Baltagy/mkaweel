import 'package:auto_route/auto_route.dart';
import 'package:mkaweel/features/screens/dashboard/ui/dashboard_screen.dart';
import 'package:mkaweel/features/screens/projects/ui/projects_screen.dart';
import 'package:mkaweel/features/screens/create_project/ui/create_project_screen.dart';
import 'package:mkaweel/features/screens/market_prices/ui/market_prices_screen.dart';
import 'package:mkaweel/features/screens/main_home/ui/main_home_screen.dart';
import 'package:mkaweel/features/screens/workers/ui/workers_screen.dart';
import 'package:mkaweel/features/screens/settings/ui/settings_screen.dart';
import 'package:mkaweel/features/screens/invoices/ui/invoices_screen.dart';
import 'package:mkaweel/features/screens/performance/ui/performance_screen.dart';
import 'package:mkaweel/features/screens/gantt_chart/ui/gantt_chart_screen.dart';
import 'package:mkaweel/features/screens/waste_calculator/ui/waste_calculator_screen.dart';
import 'package:mkaweel/features/screens/splash/ui/splash_screen.dart';
part  'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter() : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: MainHomeRoute.page,
          children: [
            AutoRoute(page: DashboardRoute.page, initial: true),
            AutoRoute(page: ProjectsRoute.page),
            AutoRoute(page: MarketPricesRoute.page),
            AutoRoute(page: WorkersRoute.page),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        AutoRoute(page: CreateProjectRoute.page),
        AutoRoute(page: InvoicesRoute.page),
        AutoRoute(page: PerformanceRoute.page),
        AutoRoute(page: GanttChartRoute.page),
        AutoRoute(page: WasteCalculatorRoute.page),
      ];
}
// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     final isLoggedIn = false; // check your auth state
//     if (isLoggedIn) {
//       resolver.next(true);
//     } else {
//       router.replace(const AuthRoute());
//     }
//   }
// }
      