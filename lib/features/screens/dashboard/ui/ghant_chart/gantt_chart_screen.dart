import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/extension/context.dart';
 import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/dashboard/ui/ghant_chart/widgets/gantt_actions_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/ghant_chart/widgets/gantt_empty_state_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/ghant_chart/widgets/gantt_project_header_widget.dart';
  import 'package:mkaweel/core/constants/app_locator.dart';

@RoutePage()
class GanttChartPage extends StatefulWidget implements AutoRouteWrapper {
  const GanttChartPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
   return this;
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.sync, color: Colors.white),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            'gantt_chart'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
              onPressed: () => context.pop(),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const GanttProjectHeaderWidget(),
                16.verticalSpace,
                const GanttEmptyStateWidget(),
                24.verticalSpace,
                const GanttActionsWidget(),
              ],
            ),
          )
        ),
      ),
    );
  }
}

abstract class GanttChartPageBaseState extends State<GanttChartPage> {

  @override
  void initState() {
    super.initState();
   }

  @override
  void dispose() {
    super.dispose();
  }
}
