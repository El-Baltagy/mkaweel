import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/start_end_date.dart';

part 'widgets/update_progress_form.dart';

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
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: args.phaseName ,
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: _buildCard  (Semantics(
            label: 'update_progress_title'.tr(),
            child: Column(
              spacing: AppPadding.p12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Percentage field
                  _ProgressPercentageField(),

                // Status dropdown
                _StatusDropdownField(),

                // Notes field
                _NotesField(),

                StartEndDates(
                  controllerE: .new(),
                  controllerS: .new(),
                  titleS: 'planned_start_date'.tr(),
                  titleE: 'planned_end_date'.tr(),
                ),
                StartEndDates(
                  controllerE: .new(),
                  controllerS: .new(),
                  titleS : 'actual_start_date'.tr(),
                  titleE: 'actual_end_date'.tr(),
                ),
                // Upload Photos
                _UploadPhotosSection(),

                // Submit button submit_progress_update
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: _SavePhaseDatesButton(
                    'submit_progress_update'.tr(),
                        () {

                    },
                  ),
                )
              ],
            ),
          ))
        ),
      ),
    );
  }

  /// Wraps content in a white rounded card consistent with app design.
  Widget _buildCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppPadding.p8),
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
class _SavePhaseDatesButton extends StatelessWidget {
  const _SavePhaseDatesButton(this.title, this.onPressed);
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.s48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLightColor,
          foregroundColor: AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.s8),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.font16SemiBold
              .copyWith(color: AppColors.lightBackground),
        ),
      ),
    );
  }
}