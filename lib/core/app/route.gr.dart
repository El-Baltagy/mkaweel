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
    AddEditTasksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AddEditTasksPage()),
      );
    },
    AddWorkerRoute.name: (routeData) {
      final args = routeData.argsAs<AddWorkerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddWorkerPage(
          key: args.key,
          args: args.args,
        )),
      );
    },
    CreateProjectRoute.name: (routeData) {
      final args = routeData.argsAs<CreateProjectRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: CreateProjectPage(
          key: args.key,
          args: args.args,
        )),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const DashboardPage()),
      );
    },
    GanttChartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const GanttChartPage()),
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
        child: WrappedRoute(
            child: MainHomePage(
          key: args.key,
          args: args.args,
        )),
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
    PhaseProgressRoute.name: (routeData) {
      final args = routeData.argsAs<PhaseProgressRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: PhaseProgressPage(
          key: args.key,
          args: args.args,
        )),
      );
    },
    ProfileScreen.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ProfileScreen()),
      );
    },
    ProjectDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProjectDetailsPage(
          key: args.key,
          args: args.args,
        )),
      );
    },
    ProjectsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ProjectsPage()),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SettingsPage()),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    SuppliersInfoRoute.name: (routeData) {
      final args = routeData.argsAs<SuppliersInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: SuppliersInfoPage(
          key: args.key,
          args: args.args,
        )),
      );
    },
    TasksRoute.name: (routeData) {
      final args = routeData.argsAs<TasksRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: TasksPage(
          key: args.key,
          args: args.args,
        )),
      );
    },
    WasteCalculatorRoute.name: (routeData) {
      final args = routeData.argsAs<WasteCalculatorRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: WasteCalculatorPage(
          key: args.key,
          args: args.args,
        )),
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
/// [AddEditTasksPage]
class AddEditTasksRoute extends PageRouteInfo<void> {
  const AddEditTasksRoute({List<PageRouteInfo>? children})
      : super(
          AddEditTasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddEditTasksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddWorkerPage]
class AddWorkerRoute extends PageRouteInfo<AddWorkerRouteArgs> {
  AddWorkerRoute({
    Key? key,
    required InvalidType args,
    List<PageRouteInfo>? children,
  }) : super(
          AddWorkerRoute.name,
          args: AddWorkerRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'AddWorkerRoute';

  static const PageInfo<AddWorkerRouteArgs> page =
      PageInfo<AddWorkerRouteArgs>(name);
}

class AddWorkerRouteArgs {
  const AddWorkerRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final InvalidType args;

  @override
  String toString() {
    return 'AddWorkerRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [CreateProjectPage]
class CreateProjectRoute extends PageRouteInfo<CreateProjectRouteArgs> {
  CreateProjectRoute({
    Key? key,
    required InvalidType args,
    List<PageRouteInfo>? children,
  }) : super(
          CreateProjectRoute.name,
          args: CreateProjectRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateProjectRoute';

  static const PageInfo<CreateProjectRouteArgs> page =
      PageInfo<CreateProjectRouteArgs>(name);
}

class CreateProjectRouteArgs {
  const CreateProjectRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final InvalidType args;

  @override
  String toString() {
    return 'CreateProjectRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GanttChartPage]
class GanttChartRoute extends PageRouteInfo<void> {
  const GanttChartRoute({List<PageRouteInfo>? children})
      : super(
          GanttChartRoute.name,
          initialChildren: children,
        );

  static const String name = 'GanttChartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainHomePage]
class MainHomeRoute extends PageRouteInfo<MainHomeRouteArgs> {
  MainHomeRoute({
    Key? key,
    required InvalidType args,
    List<PageRouteInfo>? children,
  }) : super(
          MainHomeRoute.name,
          args: MainHomeRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'MainHomeRoute';

  static const PageInfo<MainHomeRouteArgs> page =
      PageInfo<MainHomeRouteArgs>(name);
}

class MainHomeRouteArgs {
  const MainHomeRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final InvalidType args;

  @override
  String toString() {
    return 'MainHomeRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [MarketPricesPage]
class MarketPricesRoute extends PageRouteInfo<void> {
  const MarketPricesRoute({List<PageRouteInfo>? children})
      : super(
          MarketPricesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarketPricesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhaseProgressPage]
class PhaseProgressRoute extends PageRouteInfo<PhaseProgressRouteArgs> {
  PhaseProgressRoute({
    Key? key,
    required InvalidType args,
    List<PageRouteInfo>? children,
  }) : super(
          PhaseProgressRoute.name,
          args: PhaseProgressRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'PhaseProgressRoute';

  static const PageInfo<PhaseProgressRouteArgs> page =
      PageInfo<PhaseProgressRouteArgs>(name);
}

class PhaseProgressRouteArgs {
  const PhaseProgressRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final InvalidType args;

  @override
  String toString() {
    return 'PhaseProgressRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileScreen extends PageRouteInfo<void> {
  const ProfileScreen({List<PageRouteInfo>? children})
      : super(
          ProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreen';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectDetailsPage]
class ProjectDetailsRoute extends PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    Key? key,
    required InvalidType args,
    List<PageRouteInfo>? children,
  }) : super(
          ProjectDetailsRoute.name,
          args: ProjectDetailsRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectDetailsRoute';

  static const PageInfo<ProjectDetailsRouteArgs> page =
      PageInfo<ProjectDetailsRouteArgs>(name);
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final InvalidType args;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [ProjectsPage]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute({List<PageRouteInfo>? children})
      : super(
          ProjectsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuppliersInfoPage]
class SuppliersInfoRoute extends PageRouteInfo<SuppliersInfoRouteArgs> {
  SuppliersInfoRoute({
    Key? key,
    required InvalidType args,
    List<PageRouteInfo>? children,
  }) : super(
          SuppliersInfoRoute.name,
          args: SuppliersInfoRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'SuppliersInfoRoute';

  static const PageInfo<SuppliersInfoRouteArgs> page =
      PageInfo<SuppliersInfoRouteArgs>(name);
}

class SuppliersInfoRouteArgs {
  const SuppliersInfoRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final InvalidType args;

  @override
  String toString() {
    return 'SuppliersInfoRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [TasksPage]
class TasksRoute extends PageRouteInfo<TasksRouteArgs> {
  TasksRoute({
    Key? key,
    required InvalidType args,
    List<PageRouteInfo>? children,
  }) : super(
          TasksRoute.name,
          args: TasksRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static const PageInfo<TasksRouteArgs> page = PageInfo<TasksRouteArgs>(name);
}

class TasksRouteArgs {
  const TasksRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final InvalidType args;

  @override
  String toString() {
    return 'TasksRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [WasteCalculatorPage]
class WasteCalculatorRoute extends PageRouteInfo<WasteCalculatorRouteArgs> {
  WasteCalculatorRoute({
    Key? key,
    required InvalidType args,
    List<PageRouteInfo>? children,
  }) : super(
          WasteCalculatorRoute.name,
          args: WasteCalculatorRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'WasteCalculatorRoute';

  static const PageInfo<WasteCalculatorRouteArgs> page =
      PageInfo<WasteCalculatorRouteArgs>(name);
}

class WasteCalculatorRouteArgs {
  const WasteCalculatorRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final InvalidType args;

  @override
  String toString() {
    return 'WasteCalculatorRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [WorkersPage]
class WorkersRoute extends PageRouteInfo<void> {
  const WorkersRoute({List<PageRouteInfo>? children})
      : super(
          WorkersRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
