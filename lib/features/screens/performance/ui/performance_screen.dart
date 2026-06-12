import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/performance/controller/performance_cubit.dart';
 import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/performance/ui/widgets/performance_metrics_widget.dart';
import 'package:mkaweel/features/screens/performance/ui/widgets/performance_project_list_widget.dart';
import 'package:mkaweel/features/screens/performance/ui/widgets/performance_tabs_widget.dart';

@RoutePage()
class PerformancePage extends StatefulWidget implements AutoRouteWrapper {
  const PerformancePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PerformanceCubit>(
      create: (context) => PerformanceCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends PerformancePageBaseState {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Performance Comparison Screen',
      child: Scaffold(
        backgroundColor: AppColors.contractorBackground,
        appBar: AppBar(
          backgroundColor: AppColors.contractorTeal,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.sync, color: Colors.white),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            'performance_comparison'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
              onPressed: () => context.router.pop(),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocListener<PerformanceCubit, PerformanceState>(
            listener: (context, state) {},
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const PerformanceMetricsWidget(),
                  24.verticalSpace,
                  const PerformanceTabsWidget(),
                  16.verticalSpace,
                  const PerformanceProjectListWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

abstract class PerformancePageBaseState extends State<PerformancePage> {
  late final PerformanceCubit argData;

  @override
  void initState() {
    super.initState();
    argData = PerformanceCubit.get(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
