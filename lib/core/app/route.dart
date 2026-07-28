import 'package:auto_route/auto_route.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/Tasks/ui/add_edit_tasks/add_edit_tasks_screen.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/ui/dashboard_screen.dart';
import 'package:mkaweel/features/screens/dashboard/ui/ghant_chart/gant_chart_screen.dart';
import 'package:mkaweel/features/screens/dashboard/ui/invoice/invoice_screen.dart';
import 'package:mkaweel/features/screens/dashboard/ui/suppliers_info/suppliers_info_screen.dart';
import 'package:mkaweel/features/screens/dashboard/ui/waste_calculator/waste_calculator_screen.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/weather_screen.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_inoices_res/project_inoices_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/create_project_screen.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/location_selection.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/projects_screen.dart';
import 'package:mkaweel/features/screens/market_prices/ui/market_prices_screen.dart';
import 'package:mkaweel/features/screens/main_home/ui/main_home_screen.dart';
import 'package:mkaweel/features/screens/projects/ui/project_phase_update/project_phase_update_screen.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/settings/data/base_type_worker.dart';
import 'package:mkaweel/features/screens/settings/ui/change_password/change_password_screen.dart';
import 'package:mkaweel/features/screens/settings/ui/profile_screen.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
import 'package:mkaweel/features/screens/workers/data/model/all_workers/all_workers.dart';
import 'package:mkaweel/features/screens/workers/ui/workers_sc/workers_screen.dart';
import 'package:mkaweel/features/screens/settings/ui/settings_screen.dart';
import 'package:mkaweel/features/screens/splash/ui/splash_screen.dart';
import 'package:mkaweel/features/screens/login/ui/login_screen.dart';
import 'package:mkaweel/features/screens/onboarding/ui/onboarding_screen.dart';
import 'package:mkaweel/features/screens/projects/ui/project_details/project_details_screen.dart';
import 'package:mkaweel/features/screens/projects/ui/project_phases/phase_progress_screen.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/add_worker_screen.dart';
import 'package:mkaweel/features/screens/Tasks/ui/Tasks/tasks_screen.dart';
 import 'package:mkaweel/features/screens/projects/ui/project_invoices/project_invoices_screen.dart';
import 'package:mkaweel/features/screens/attendence/ui/attendence/attendence_screen.dart';
part 'route.gr.dart';

  @AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
      AutoRoute(
        page: AttendenceRoute.page,
       ),
      AutoRoute(
        page: ProjectInvoicesRoute.page,
       ),
      AutoRoute(
        page: InvoiceRoute.page,
       ),
      AutoRoute(
        page: ProjectPhaseUpdateRoute.page,
       ),
      AutoRoute(
        page: ChangePasswordRoute.page,
       ),
      AutoRoute(
        page: WeatherRoute.page,
       ),
    AutoRoute(
      page: SuppliersInfoRoute.page,
     ),
    AutoRoute(
      page: AddEditTasksRoute.page,
     ),

    AutoRoute(
      page: TasksRoute.page,
     ),

    AutoRoute(
      page: AddWorkerRoute.page,
     ),
    AutoRoute(page: ProjectDetailsRoute.page),
    AutoRoute(page: PhaseProgressRoute.page),
    AutoRoute(page: LoginRoute.page, guards: [AuthGuard()]),
    AutoRoute(page: OnboardingRoute.page, guards: [AuthGuard()]),
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(
      page: MainHomeRoute.page,
      guards: [AuthGuard()],
      children: [
        AutoRoute(page: DashboardRoute.page, initial: true),
        AutoRoute(page: ProjectsRoute.page),
        AutoRoute(page: MarketPricesRoute.page),
        AutoRoute(page: WorkersRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: TasksRoute.page),
        AutoRoute(page:  AttendenceRoute.page),
      ],
    ),
    AutoRoute(page: CreateProjectRoute.page),
    AutoRoute(page: CreateTaskRoute.page),
    AutoRoute(page: PerformanceRoute.page),
    AutoRoute(page: GanttChartRoute.page),
    AutoRoute(page: WasteCalculatorRoute.page),
    AutoRoute(page: ProfileScreenPageRoute.page),
  ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (StorageHelper.isLogined) {
      // If logged in, allow navigation. If trying to go to login/onboarding/splash, redirect to MainHome (Dashboard)
      if (resolver.route.name == LoginRoute.name ||
          resolver.route.name == OnboardingRoute.name ||
          resolver.route.name == SplashRoute.name) {
        resolver.redirect(MainHomeRoute(args: const MainHomeRouteArgs()));
      } else {
        resolver.next();
      }
    } else {
      if (!StorageHelper.hasViewedOnboarding && false) {
        if (resolver.route.name == OnboardingRoute.name) {
          resolver.next();
        } else {
          resolver.redirect(const OnboardingRoute());
        }
      } else {
        if (resolver.route.name == LoginRoute.name) {
          resolver.next();
        } else {
          resolver.redirect(const LoginRoute());
        }
      }
    }
  }
}
