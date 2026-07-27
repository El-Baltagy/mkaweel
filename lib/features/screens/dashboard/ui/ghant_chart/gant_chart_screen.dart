import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_res/ghant_res.dart';
import 'package:mkaweel/features/screens/dashboard/ui/ghant_chart/widgets/custom_bar_chart_widget.dart';
 import 'package:mkaweel/features/screens/dashboard/ui/ghant_chart/widgets/gantt_project_dropdown_widget.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/settings/data/base_type_worker.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'ghant_screen_mixin.dart';
part 'widgets/gant_chart_widget.dart';

@RoutePage()
class GanttChartPage extends StatefulWidget implements AutoRouteWrapper {
  const GanttChartPage({super.key, required this.args});

  final GanttChartRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: args.dashboardCubit),
        BlocProvider<ProjectsCubit>(
          create: (context) => ProjectsCubit(AppLocator()()()),
        ),
      ],
      child: this,
    );
  }

  @override
  State<GanttChartPage> createState() => _GanttChartPageState();
}

class _GanttChartPageState extends GanttChartPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Gantt Chart Screen',
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: 'gantt_chart'.tr(),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.sync, color: Colors.white),
            //   onPressed: () {},
            // )
          ]
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:  .center,
              children: [
                const GanttProjectDropdownWidget(),
                24.verticalSpace,
                
                const GhantChart(),

                32.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}

