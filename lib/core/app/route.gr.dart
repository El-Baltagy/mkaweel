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
    MakeBusRoute.name: (routeData) {
      final args = routeData.argsAs<MakeBusRouteArgs>(orElse: () => const MakeBusRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: MakeBusPage(
           args: args ,
        )),
      );
    },
    AddWorkerRoute.name: (routeData) {
      final args = routeData.argsAs<AddWorkerRouteArgs>(orElse: () => const AddWorkerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddWorkerPage(
           args: args ,
        )),
      );
    },
    ProjectDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailsRouteArgs>(orElse: () => const ProjectDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProjectDetailsPage(
           args: args ,
        )),
      );
    },
    PhaseProgressRoute.name: (routeData) {
      final args = routeData.argsAs<PhaseProgressRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: PhaseProgressPage(
           args: args ,
        )),
      );
    },
    CreateProjectRoute.name: (routeData) {
      final args = routeData.argsAs<CreateProjectRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child:   CreateProjectPage(
          args: args,
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
    InvoicesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const InvoicesPage()),
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
           args: args ,
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
    PerformanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const PerformancePage()),
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
    WasteCalculatorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const WasteCalculatorPage()),
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
/// [CreateProjectPage]

class CreateProjectRoute extends PageRouteInfo<CreateProjectRouteArgs> {
  CreateProjectRoute({
    required CreateProjectRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(
    CreateProjectRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'CreateProjectRoute';

  static const PageInfo<CreateProjectRouteArgs> page =
  PageInfo<CreateProjectRouteArgs>(name);
}
class CreateProjectRouteArgs {
  const CreateProjectRouteArgs(
      this.projectId
      );
  final String? projectId;
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
/// [InvoicesPage]
class InvoicesRoute extends PageRouteInfo<void> {
  const InvoicesRoute({List<PageRouteInfo>? children})
      : super(
          InvoicesRoute.name,
          initialChildren: children,
        );

  static const String name = 'InvoicesRoute';

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


class MainHomeRouteArgs {
  const MainHomeRouteArgs( );
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
/// [PerformancePage]
class PerformanceRoute extends PageRouteInfo<void> {
  const PerformanceRoute({List<PageRouteInfo>? children})
      : super(
          PerformanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'PerformanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [WasteCalculatorPage]
class WasteCalculatorRoute extends PageRouteInfo<void> {
  const WasteCalculatorRoute({List<PageRouteInfo>? children})
      : super(
          WasteCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'WasteCalculatorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
/// generated route for
/// [ProfileScreenPage]
class ProfileScreenPageRoute extends PageRouteInfo<void> {
  const ProfileScreenPageRoute({List<PageRouteInfo>? children})
      : super(
    ProfileScreenPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreenPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

/// generated route for
/// [ProjectDetailsPage]
class ProjectDetailsRoute extends PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    required  ProjectDetailsRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    ProjectDetailsRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'ProjectDetailsRoute';

  static const PageInfo<ProjectDetailsRouteArgs> page =
  PageInfo<ProjectDetailsRouteArgs>(name);
}
class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs( );
}

/// generated route for
/// [PhaseProgressPage]
class PhaseProgressRoute extends PageRouteInfo<PhaseProgressRouteArgs> {
  PhaseProgressRoute({
    required PhaseProgressRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(
    PhaseProgressRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'PhaseProgressRoute';

  static const PageInfo<PhaseProgressRouteArgs> page =
  PageInfo<PhaseProgressRouteArgs>(name);
}
class PhaseProgressRouteArgs {
  const PhaseProgressRouteArgs({required this.phaseName});
  final String phaseName;
}

///generated route for
/// [MainHomePage]
class MainHomeRoute extends PageRouteInfo<MainHomeRouteArgs> {
  MainHomeRoute({
    required MainHomeRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(
    MainHomeRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'MainHomeRoute';

  static const PageInfo<MainHomeRouteArgs> page =
  PageInfo<MainHomeRouteArgs>(name);
}

/// generated route for
/// [AddWorkerPage]
class AddWorkerRoute extends PageRouteInfo<AddWorkerRouteArgs> {
  AddWorkerRoute({
   required AddWorkerRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AddWorkerRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AddWorkerRoute';

  static const PageInfo<AddWorkerRouteArgs> page =
  PageInfo<AddWorkerRouteArgs>(name);
}
class AddWorkerRouteArgs {
  const AddWorkerRouteArgs( );
}

/// generated route for
/// [MakeBusPage]
class MakeBusRoute extends PageRouteInfo<MakeBusRouteArgs> {
  MakeBusRoute({
   required MakeBusRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    MakeBusRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'MakeBusRoute';

  static const PageInfo<MakeBusRouteArgs> page =
  PageInfo<MakeBusRouteArgs>(name);
}
class MakeBusRouteArgs {
  const MakeBusRouteArgs( );
}
