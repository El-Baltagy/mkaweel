import 'dart:async';

import 'package:auto_route/auto_route.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
 import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/internet/connected_bloc.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/dashboard_header_widget.dart';
 import 'package:mkaweel/features/screens/dashboard/ui/widgets/today_tasks_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/quick_tools_widget.dart';

@RoutePage()
class DashboardPage extends StatefulWidget implements AutoRouteWrapper {
  const DashboardPage({super.key });
 // final TabsRouter
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
    return Scaffold(
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
                    tasksCubit: tasksCubit,
                  );
                },
              ),
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
    );
  }


}

abstract class DashboardPageBaseState extends State<DashboardPage> {
  late final DashboardCubit dashboardCubit;
  late final TasksCubit tasksCubit;
  late final StreamSubscription<bool> _connectivitySubscription;

  @override
  void initState() {
    dashboardCubit = DashboardCubit.get(context: context);
    tasksCubit = TasksCubit.get(context: context);
    super.initState();
    dashboardCubit.getStatisticsFunc(Init());
    tasksCubit.getAllTasksFunc(parameter: const AdminTasksData(.today));
    _connectivitySubscription =
        ConnectivityService.connectivityStream.listen(_listenIntoInternetChange);
  }

  _listenIntoInternetChange(bool hasInternet) {
    if (hasInternet) {
      dashboardCubit.getStatisticsFunc(Init());
      tasksCubit.getAllTasksFunc(parameter: const AdminTasksData(.today));
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }


}
