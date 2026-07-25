
import 'package:mkaweel/features/screens/attendence/data/repo/remote/attendence_repo.dart';
import 'package:mkaweel/features/screens/attendence/service/attendence_service.dart';
import 'package:mkaweel/features/screens/attendence/controller/attendence_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/data/repo/remote/Tasks_repo.dart';
import 'package:mkaweel/features/screens/Tasks/service/Tasks_service.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/login/data/repo/remote/login_repo.dart';
import 'package:mkaweel/features/screens/login/service/login_service.dart';
import 'package:mkaweel/features/screens/login/controller/login_cubit.dart';
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
 import 'package:mkaweel/features/screens/projects/data/repo/remote/projects_repo.dart';
import 'package:mkaweel/features/screens/projects/service/projects_service.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/data/repo/remote/dashboard_repo.dart';
import 'package:mkaweel/features/screens/dashboard/service/dashboard_service.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/core/theming/theme_cubit.dart';

class AppLocator {
  factory AppLocator() => _instance;

  AppLocator._();

  static final AppLocator _instance = AppLocator._();

  final _sl = GetIt.instance;

  GetIt call() => _sl;

  void init(){
    ///..................attendence.................///
    _sl.registerLazySingleton(() => AttendenceRepo(_sl()));
    _sl.registerLazySingleton(() => AttendenceService(_sl(), _sl()));
    _sl.registerFactory(() => AttendenceCubit(_sl()));


    ///..................tasks.................///
    _sl.registerLazySingleton(() => TasksRepo(_sl()));
    _sl.registerLazySingleton(() => TasksService(_sl(), _sl()));
    _sl.registerFactory(() => TasksCubit(_sl()));

    ///..................login.................///
    _sl.registerLazySingleton(() => LoginRepo(_sl()));
    _sl.registerLazySingleton(() => LoginService(_sl(), _sl()));
    _sl.registerFactory(() => LoginCubit(_sl()));


    ///..................market_prices.................///
    _sl.registerLazySingleton(() => MarketPricesRepo(_sl()));
    _sl.registerLazySingleton(() => MarketPricesService(_sl(), _sl()));
    _sl.registerFactory(() => MarketPricesCubit(_sl()));


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
    _sl.registerLazySingleton<BaseLocalRepo>(
      () => BaseLocalRepo(
        primarySessionId: DateTime.now().millisecondsSinceEpoch.toString(),
        secondarySessionId:( DateTime.now().millisecondsSinceEpoch+1111).toString(),
       ),
    );
    _sl.registerLazySingleton<DioHelper>(() => DioHelper.instance);
    _sl.registerLazySingleton<ThemeCubit>(ThemeCubit.new);
  }
}
