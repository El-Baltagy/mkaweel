import 'package:auto_route/auto_route.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
 import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/dashboard_header_widget.dart';
 import 'package:mkaweel/features/screens/dashboard/ui/widgets/today_tasks_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/quick_tools_widget.dart';

@RoutePage()
class DashboardPage extends StatefulWidget implements AutoRouteWrapper {
  const DashboardPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider<TasksCubit>(
        create: (context) =>  AppLocator()()() ,
      ),
      BlocProvider<DashboardCubit>(
        create: (context) => DashboardCubit(AppLocator()()()),
      ),
    ] , child: this);

  }

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends DashboardPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardCubit, DashboardState>(
      listener: listener,
      child: Semantics(
        label: 'Dashboard Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            toolbarHeight: 5,
          ),
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  BlocSelector<DashboardCubit, DashboardState, BaseEmit?>(
                    selector: (state)  =>state is DashboardLoaded ? state.getStatisticsState : null ,
                    builder: (context, state) {
                      return DashboardHeaderWidget(
                        state: state,
                      );
                    },
                  ),
                  // const StatsCardsWidget(),
                    TodayTasksWidget(
                      tasksCubit: tasksCubit
                    ),
                  QuickToolsWidget(
                      dashboardCubit: dashboardCubit
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

abstract class DashboardPageBaseState extends State<DashboardPage> {
  late final DashboardCubit dashboardCubit;
  late final TasksCubit tasksCubit;

  @override
  void initState() {
    dashboardCubit = DashboardCubit.get(context: context);
    tasksCubit = TasksCubit.get(context: context);
    super.initState();
    dashboardCubit.getStatisticsFunc(Init());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void listener(context, state) {
    // TODO: implement listener
  }
}
