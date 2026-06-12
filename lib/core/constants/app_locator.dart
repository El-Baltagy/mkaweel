
import 'package:mkaweel/features/screens/waste_calculator/data/repo/remote/waste_calculator_repo.dart';
import 'package:mkaweel/features/screens/waste_calculator/service/waste_calculator_service.dart';
import 'package:mkaweel/features/screens/waste_calculator/controller/waste_calculator_cubit.dart';
import 'package:mkaweel/features/screens/performance/data/repo/remote/performance_repo.dart';
import 'package:mkaweel/features/screens/performance/service/performance_service.dart';
import 'package:mkaweel/features/screens/performance/controller/performance_cubit.dart';
import 'package:mkaweel/features/screens/invoices/data/repo/remote/invoices_repo.dart';
import 'package:mkaweel/features/screens/invoices/service/invoices_service.dart';
import 'package:mkaweel/features/screens/invoices/controller/invoices_cubit.dart';
import 'package:mkaweel/features/screens/gantt_chart/data/repo/remote/gantt_chart_repo.dart';
import 'package:mkaweel/features/screens/gantt_chart/service/gantt_chart_service.dart';
import 'package:mkaweel/features/screens/gantt_chart/controller/gantt_chart_cubit.dart';
import 'package:mkaweel/features/screens/settings/data/repo/remote/settings_repo.dart';
import 'package:mkaweel/features/screens/settings/service/settings_service.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/workers/data/repo/remote/workers_repo.dart';
import 'package:mkaweel/features/screens/workers/service/workers_service.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
import 'package:mkaweel/features/screens/main_home/data/repo/remote/main_home_repo.dart';
import 'package:mkaweel/features/screens/main_home/service/main_home_service.dart';
import 'package:mkaweel/features/screens/main_home/controller/main_home_cubit.dart';
import 'package:mkaweel/features/screens/market_prices/data/repo/remote/market_prices_repo.dart';
import 'package:mkaweel/features/screens/market_prices/service/market_prices_service.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_cubit.dart';
import 'package:mkaweel/features/screens/create_project/data/repo/remote/create_project_repo.dart';
import 'package:mkaweel/features/screens/create_project/service/create_project_service.dart';
import 'package:mkaweel/features/screens/create_project/controller/create_project_cubit.dart';
import 'package:mkaweel/features/screens/projects/data/repo/remote/projects_repo.dart';
import 'package:mkaweel/features/screens/projects/service/projects_service.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/data/repo/remote/dashboard_repo.dart';
import 'package:mkaweel/features/screens/dashboard/service/dashboard_service.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';




class AppLocator {
  factory AppLocator() => _instance;
  AppLocator._();
  static final AppLocator _instance = AppLocator._();

  final _sl = GetIt.instance;
  GetIt call() => _sl;

  void init(){
    ///..................waste_calculator.................///
    _sl.registerLazySingleton(() => WasteCalculatorRepo(_sl()));
    _sl.registerLazySingleton(() => WasteCalculatorService(_sl(), _sl()));
    _sl.registerFactory(() => WasteCalculatorCubit(_sl()));

    ///..................performance.................///
    _sl.registerLazySingleton(() => PerformanceRepo(_sl()));
    _sl.registerLazySingleton(() => PerformanceService(_sl(), _sl()));
    _sl.registerFactory(() => PerformanceCubit(_sl()));

    ///..................invoices.................///
    _sl.registerLazySingleton(() => InvoicesRepo(_sl()));
    _sl.registerLazySingleton(() => InvoicesService(_sl(), _sl()));
    _sl.registerFactory(() => InvoicesCubit(_sl()));

    ///..................gantt_chart.................///
    _sl.registerLazySingleton(() => GanttChartRepo(_sl()));
    _sl.registerLazySingleton(() => GanttChartService(_sl(), _sl()));
    _sl.registerFactory(() => GanttChartCubit(_sl()));

    ///..................market_prices.................///
    _sl.registerLazySingleton(() => MarketPricesRepo(_sl()));
    _sl.registerLazySingleton(() => MarketPricesService(_sl(), _sl()));
    _sl.registerFactory(() => MarketPricesCubit(_sl()));

    ///..................create_project.................///
    _sl.registerLazySingleton(() => CreateProjectRepo(_sl()));
    _sl.registerLazySingleton(() => CreateProjectService(_sl(), _sl()));
    _sl.registerFactory(() => CreateProjectCubit(_sl()));

    ///..................projects.................///
    _sl.registerLazySingleton(() => ProjectsRepo(_sl()));
    _sl.registerLazySingleton(() => ProjectsService(_sl(), _sl()));
    _sl.registerFactory(() => ProjectsCubit(_sl()));

    ///..................dashboard.................///
    _sl.registerLazySingleton(() => DashboardRepo(_sl()));
    _sl.registerLazySingleton(() => DashboardService(_sl(), _sl()));
    _sl.registerFactory(() => DashboardCubit(_sl()));

    ///..................workers.................///
    _sl.registerLazySingleton(() => WorkersRepo(_sl()));
    _sl.registerLazySingleton(() => WorkersService(_sl(), _sl()));
    _sl.registerFactory(() => WorkersCubit(_sl()));

    ///..................settings.................///
    _sl.registerLazySingleton(() => SettingsRepo(_sl()));
    _sl.registerLazySingleton(() => SettingsService(_sl(), _sl()));
    _sl.registerFactory(() => SettingsCubit(_sl()));

    ///..................main_home.................///
    _sl.registerLazySingleton(() => MainHomeRepo(_sl()));
    _sl.registerLazySingleton(() => MainHomeService(_sl(), _sl()));
    _sl.registerFactory(() => MainHomeCubit(_sl()));


    // ── Global Services ──────────────────────────────────────────────────────
    _sl.registerLazySingleton<BaseLocalRepo>(BaseLocalRepo.new);
    _sl.registerLazySingleton<DioHelper>(() => DioHelper()..call());

  }
}





