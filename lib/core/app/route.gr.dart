// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AttendenceRoute.name: (routeData) {
      final args = routeData.argsAs<AttendenceRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AttendencePage(
           args: args ,
        )),
      );
    },
    ProjectInvoicesRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectInvoicesRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProjectInvoicesPage(
           args: args ,
        )),
      );
    },
    InvoiceRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: InvoicePage(
           args: args ,
        )),
      );
    },
    ProjectPhaseUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectPhaseUpdateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProjectPhaseUpdatePage(
           args: args ,
        )),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ChangePasswordPage(
           args: args ,
        )),
      );
    },
    WeatherRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: WeatherPage(
           args: args ,
        )),
      );
    },
    SuppliersInfoRoute.name: (routeData) {
      final args = routeData.argsAs<SuppliersInfoRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: SuppliersInfoPage(
              args: args ,
            )),
      );
    },
    GanttChartRoute.name: (routeData) {
      final args = routeData.argsAs<GanttChartRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child:   GanttChartPage(args:args)),
      );
    },

    AddEditTasksRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditTasksRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddEditTasksPage(
              args: args ,
            )),
      );
    },

    TasksRoute.name: (routeData) {
      final args = routeData.argsAs<TasksRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: TasksPage(args: args)),
      );
    },

    WasteCalculatorRoute.name: (routeData) {
      final args = routeData.argsAs<WasteCalculatorRouteArgs>(   );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: WasteCalculatorPage(args: args)),
      );
    },

    AddWorkerRoute.name: (routeData) {
      final args = routeData.argsAs<AddWorkerRouteArgs>(
        orElse: () => AddWorkerRouteArgs.noArgs(),
      );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: AddWorkerPage(args: args)),
      );
    },

    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: SettingsPage(args: args)),
      );
    },
    ProjectDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: ProjectDetailsPage(args: args)),
      );
    },
    PhaseProgressRoute.name: (routeData) {
      final args = routeData.argsAs<PhaseProgressRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: PhaseProgressPage(args: args)),
      );
    },
    CreateProjectRoute.name: (routeData) {
      final args = routeData.argsAs<CreateProjectRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: CreateProjectPage(args: args)),
      );
    },
    //ProfileScreenPageRoute
    ProfileScreenPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: ProfileScreen(args: args)),
      );
    },
    DashboardRoute.name: (routeData) {
      // final args = routeData.argsAs< DashboardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child:   DashboardPage( )) ,
      );
    },

    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginPage()),
      );
    },
    MainHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MainHomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: MainHomePage(args: args)),
      );
    },
    MarketPricesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MarketPricesPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },

    ProjectsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ProjectsPage()),
      );
    },

    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },

    WorkersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const WorkersPage()),
      );
    },
  };
}

/// generated route for
/// [CreateTaskPage]
class CreateTaskRoute extends PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute({
    required CreateTaskRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(CreateTaskRoute.name, args: args, initialChildren: children);

  static const String name = 'CreateTaskRoute';

  static const PageInfo<CreateTaskRouteArgs> page =
  PageInfo<CreateTaskRouteArgs>(name);
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs();

  static CreateTaskRouteArgs noArgs() => CreateTaskRouteArgs();
}

/// generated route for
/// [CreateProjectPage]

class CreateProjectRoute extends PageRouteInfo<CreateProjectRouteArgs> {
  CreateProjectRoute({
    required CreateProjectRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(CreateProjectRoute.name, args: args, initialChildren: children);

  static const String name = 'CreateProjectRoute';

  static const PageInfo<CreateProjectRouteArgs> page =
  PageInfo<CreateProjectRouteArgs>(name);
}

class CreateProjectRouteArgs {
  const CreateProjectRouteArgs(this.projectId,this.projectsCubit);

  final String? projectId;
  final ProjectsCubit   projectsCubit;
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({    List<PageRouteInfo>? children})
      : super(DashboardRoute.name,   initialChildren: children);

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
class DashboardRouteArgs {
  const DashboardRouteArgs(  );
  // final TabsRouter tabsRouter;
 }
/// generated route for
/// [GanttChartPage]

class GanttChartRoute extends PageRouteInfo<GanttChartRouteArgs> {
  GanttChartRoute({
    required GanttChartRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    GanttChartRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'GanttChartRoute';

  static const PageInfo<GanttChartRouteArgs> page =
  PageInfo<GanttChartRouteArgs>(name);
}
class GanttChartRouteArgs {
  const GanttChartRouteArgs(this.dashboardCubit );
  final DashboardCubit dashboardCubit;
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class MainHomeRouteArgs {
  const MainHomeRouteArgs();
}

/// generated route for
/// [MarketPricesPage]
class MarketPricesRoute extends PageRouteInfo<void> {
  const MarketPricesRoute({List<PageRouteInfo>? children})
      : super(MarketPricesRoute.name, initialChildren: children);

  static const String name = 'MarketPricesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PerformancePage]
class PerformanceRoute extends PageRouteInfo<void> {
  const PerformanceRoute({List<PageRouteInfo>? children})
      : super(PerformanceRoute.name, initialChildren: children);

  static const String name = 'PerformanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectsPage]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute({List<PageRouteInfo>? children})
      : super(ProjectsRoute.name, initialChildren: children);

  static const String name = 'ProjectsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}


/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkersPage]
class WorkersRoute extends PageRouteInfo<void> {
  const WorkersRoute({List<PageRouteInfo>? children})
      : super(WorkersRoute.name, initialChildren: children);

  static const String name = 'WorkersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectDetailsPage]
class ProjectDetailsRoute extends PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    required ProjectDetailsRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(ProjectDetailsRoute.name, args: args, initialChildren: children);

  static const String name = 'ProjectDetailsRoute';

  static const PageInfo<ProjectDetailsRouteArgs> page =
  PageInfo<ProjectDetailsRouteArgs>(name);
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({required this.projectsCubit,required this.projectInfoData});

  final ProjectsCubit projectsCubit;
  final ProjectInfoData projectInfoData;
}

/// generated route for
/// [PhaseProgressPage]
class PhaseProgressRoute extends PageRouteInfo<PhaseProgressRouteArgs> {
  PhaseProgressRoute({
    required PhaseProgressRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(PhaseProgressRoute.name, args: args, initialChildren: children);

  static const String name = 'PhaseProgressRoute';

  static const PageInfo<PhaseProgressRouteArgs> page =
  PageInfo<PhaseProgressRouteArgs>(name);
}

class PhaseProgressRouteArgs {
  const PhaseProgressRouteArgs({required this.projectPhaseItem,required this.projectsCubit });
  final ProjectphaseItem   projectPhaseItem;
  final ProjectsCubit   projectsCubit;
}

///generated route for
/// [MainHomePage]
class MainHomeRoute extends PageRouteInfo<MainHomeRouteArgs> {
  MainHomeRoute({
    required MainHomeRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(MainHomeRoute.name, args: args, initialChildren: children);

  static const String name = 'MainHomeRoute';

  static const PageInfo<MainHomeRouteArgs> page = PageInfo<MainHomeRouteArgs>(
    name,
  );
}

/// generated route for
/// [AddWorkerPage]
class AddWorkerRoute extends PageRouteInfo<AddWorkerRouteArgs> {
  AddWorkerRoute({
    required AddWorkerRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(AddWorkerRoute.name, args: args, initialChildren: children);

  static const String name = 'AddWorkerRoute';

  static const PageInfo<AddWorkerRouteArgs> page = PageInfo<AddWorkerRouteArgs>(
    name,
  );
}

class AddWorkerRouteArgs {
  const AddWorkerRouteArgs({
    required this.workerItem,
    required this.projectsCubit,
    required this.workersCubit,
  });

  final WorkerItem? workerItem;
  final ProjectsCubit? projectsCubit;
  final WorkersCubit? workersCubit;

  static AddWorkerRouteArgs noArgs() => AddWorkerRouteArgs(
    workerItem: null,
    projectsCubit: null,
    workersCubit: null,
  );
}

/// generated route for
/// [TasksPage]
class TasksRoute extends PageRouteInfo<TasksRouteArgs> {
  TasksRoute({required TasksRouteArgs args, List<PageRouteInfo>? children})
      : super(TasksRoute.name, args: args, initialChildren: children);

  static const String name = 'TasksRoute';

  static const PageInfo<TasksRouteArgs> page = PageInfo<TasksRouteArgs>(name);
}

class TasksRouteArgs {
  const TasksRouteArgs(this.baseTasksData,{this.tasksCubit});
final BaseTasksData baseTasksData;
final TasksCubit? tasksCubit;
 }




/// generated route for
/// [TasksvPage]
class WasteCalculatorRoute extends PageRouteInfo<WasteCalculatorRouteArgs> {
  WasteCalculatorRoute({required WasteCalculatorRouteArgs args, List<PageRouteInfo>? children})
      : super(WasteCalculatorRoute.name, args: args, initialChildren: children);

  static const String name = 'WasteCalculatorRoute';

  static const PageInfo<WasteCalculatorRouteArgs> page = PageInfo<WasteCalculatorRouteArgs>(name);
}

class WasteCalculatorRouteArgs {
  const WasteCalculatorRouteArgs(this.dashboardCubit);
  final DashboardCubit dashboardCubit;
}




/// generated route for
/// [SuppliersInfoPage]
class SuppliersInfoRoute extends PageRouteInfo<SuppliersInfoRouteArgs> {
  SuppliersInfoRoute({
    required SuppliersInfoRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    SuppliersInfoRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'SuppliersInfoRoute';

  static const PageInfo<SuppliersInfoRouteArgs> page =
  PageInfo<SuppliersInfoRouteArgs>(name);
}
class SuppliersInfoRouteArgs {
  const SuppliersInfoRouteArgs( );
  static SuppliersInfoRouteArgs noArgs()=>SuppliersInfoRouteArgs();
}
/// generated route for
/// [AddEditTasksPage]
class AddEditTasksRoute extends PageRouteInfo<AddEditTasksRouteArgs> {
  AddEditTasksRoute({
    required AddEditTasksRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AddEditTasksRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AddEditTasksRoute';

  static const PageInfo<AddEditTasksRouteArgs> page =
  PageInfo<AddEditTasksRouteArgs>(name);
}
class AddEditTasksRouteArgs {
  const AddEditTasksRouteArgs( this.taskItem,this.tasksCubit,this.baseTasksData);
  final TaskItem? taskItem;
  final TasksCubit tasksCubit;
  final BaseTasksData baseTasksData;

 }

/// generated route for
/// [WeatherPage]
class WeatherRoute extends PageRouteInfo<WeatherRouteArgs> {
  WeatherRoute({
   required WeatherRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    WeatherRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'WeatherRoute';

  static const PageInfo<WeatherRouteArgs> page =
  PageInfo<WeatherRouteArgs>(name);
}
class WeatherRouteArgs {
  const WeatherRouteArgs(this.dashboardCubit,{this.latlng} );
  final DashboardCubit? dashboardCubit;
  final LatLng? latlng;
 }


/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
   required SettingsRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    SettingsRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
  PageInfo<SettingsRouteArgs>(name);
}
class SettingsRouteArgs {
  const SettingsRouteArgs( this.baseUserType );
final BaseUserType baseUserType;
 }


/// generated route for
/// [ProfileScreenPagePage]
class ProfileScreenPageRoute extends PageRouteInfo<ProfileScreenPageRouteArgs> {
  ProfileScreenPageRoute({
    required ProfileScreenPageRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    ProfileScreenPageRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'ProfileScreenPageRoute';

  static const PageInfo<ProfileScreenPageRouteArgs> page =
  PageInfo<ProfileScreenPageRouteArgs>(name);
}

class ProfileScreenPageRouteArgs {
  const ProfileScreenPageRouteArgs(
      this.settingsCubit
      );
  final SettingsCubit  settingsCubit;
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
   required ChangePasswordRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    ChangePasswordRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<ChangePasswordRouteArgs> page =
  PageInfo<ChangePasswordRouteArgs>(name);
}
class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs(
      this.settingsCubit
      );
    final SettingsCubit  settingsCubit;
}

/// generated route for
/// [ProjectPhaseUpdatePage]
class ProjectPhaseUpdateRoute extends PageRouteInfo<ProjectPhaseUpdateRouteArgs> {
  ProjectPhaseUpdateRoute({
   required ProjectPhaseUpdateRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    ProjectPhaseUpdateRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'ProjectPhaseUpdateRoute';

  static const PageInfo<ProjectPhaseUpdateRouteArgs> page =
  PageInfo<ProjectPhaseUpdateRouteArgs>(name);
}
class ProjectPhaseUpdateRouteArgs {
  const ProjectPhaseUpdateRouteArgs({
    required this.phaseId,
    required this.projectsCubit,
  });
  final int phaseId;
  final ProjectsCubit projectsCubit;
}

/// generated route for
/// [InvoicePage]
class InvoiceRoute extends PageRouteInfo<InvoiceRouteArgs> {
  InvoiceRoute({
   required InvoiceRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    InvoiceRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'InvoiceRoute';

  static const PageInfo<InvoiceRouteArgs> page =
  PageInfo<InvoiceRouteArgs>(name);
}
class InvoiceRouteArgs {
  const InvoiceRouteArgs( this.dashboardCubit,this.invoiceItem);
  final DashboardCubit? dashboardCubit;
  final (InvoiceItem,Budgetsummary)? invoiceItem;
 }

/// generated route for
/// [ProjectInvoicesPage]
class ProjectInvoicesRoute extends PageRouteInfo<ProjectInvoicesRouteArgs> {
  ProjectInvoicesRoute({
   required ProjectInvoicesRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    ProjectInvoicesRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'ProjectInvoicesRoute';

  static const PageInfo<ProjectInvoicesRouteArgs> page =
  PageInfo<ProjectInvoicesRouteArgs>(name);
}
class ProjectInvoicesRouteArgs {
  const ProjectInvoicesRouteArgs( this.projectsCubit,this.projectID);
  final ProjectsCubit projectsCubit;
  final String projectID;
 }

/// generated route for
/// [AttendencePage]
class AttendenceRoute extends PageRouteInfo<AttendenceRouteArgs> {
  AttendenceRoute({
   required AttendenceRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AttendenceRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AttendenceRoute';

  static const PageInfo<AttendenceRouteArgs> page =
  PageInfo<AttendenceRouteArgs>(name);
}
class AttendenceRouteArgs {
  const AttendenceRouteArgs( );
 }
