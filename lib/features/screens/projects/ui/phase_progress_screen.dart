import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/core/app/route.dart';

part 'widgets/update_progress_form.dart';
part 'widgets/phase_information_section.dart';

@RoutePage()
class PhaseProgressPage extends StatefulWidget implements AutoRouteWrapper {
  const PhaseProgressPage({super.key, required this.args});
  final PhaseProgressRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProjectsCubit>(
      create: (context) => ProjectsCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<PhaseProgressPage> createState() => _PhaseProgressPageState();
}

class _PhaseProgressPageState extends PhaseProgressPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: AppColors.lightBackground,
          elevation: 0,
          leading: Semantics(
            label: 'back',
            button: true,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: AppColors.lightTextPrimary, size: AppSizes.s20),
              onPressed: () => context.router.back(),
            ),
          ),
          title: Text(
            args.phaseName,
            style: AppTextStyles.font18SemiBold,
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Update Progress & Percentage section
              _buildCard(const _UpdateProgressForm()),

              AppPadding.p16.verticalSpace,

              // Phase Information section
              _buildCard(const _PhaseInformationSection()),

              AppPadding.p24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  /// Wraps content in a white rounded card consistent with app design.
  Widget _buildCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        border: Border.all(color: AppColors.lightBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

abstract class PhaseProgressPageBaseState extends State<PhaseProgressPage> {
  late final ProjectsCubit argData;

  @override
  void initState() {
    argData = ProjectsCubit.get(context: context);
    super.initState();
  }

  /// Convenient getter for the route arguments passed to this page.
  PhaseProgressRouteArgs get args => widget.args;

  @override
  void dispose() {
    super.dispose();
  }
}
