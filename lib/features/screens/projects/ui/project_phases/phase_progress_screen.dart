import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/start_end_date.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/title_with_input.dart';

part 'widgets/update_progress_form.dart';
part 'widgets/save_button.dart';
part 'phase_progress_mixin.dart';

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
      listener: listener,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: args.phaseName,
        ),

        body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: _buildCard(Semantics(
              label: 'update_progress_title'.tr(),
              child: Form(
                key: _key,
                child: Column(
                  spacing: AppPadding.p12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress Percentage field
                    _ProgressPercentageField(),

                    // Notes field
                    //notes_hint notes_label
                    TitleWithInputField(
                      'notes_hint'.tr(),
                      NameInputData(
                        isLabel: false,
                        widgetPrefix: const SizedBox.shrink(),
                        validator: (v) => null,
                        labelText:
                        'notes_label'.tr() + "...",
                        controller: _controllerDesc,
                      ),
                    ),

                    StartEndDates(
                      controllerE: _controllerPE,
                      controllerS: _controllerPS,
                      // fieldS:listFiels[1],
                      // fieldE:listFiels[2],
                      titleS: 'planned_start_date'.tr(),
                      titleE: 'planned_end_date'.tr(),
                    ),

                    StartEndDates(
                      controllerE: _controllerAE,
                      controllerS: _controllerAS,
                      titleS: 'actual_start_date'.tr(),
                      titleE: 'actual_end_date'.tr(),
                      // fieldS:listFiels[3],
                      // fieldE:listFiels[4],
                    ),
                    // Upload Photos
                    const _UploadPhotosSection(),

                    // Submit button submit_progress_update
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: _SavePhaseDatesButton(
                        'submit_progress_update'.tr(),
                             updateAction
                      ),
                    )
                  ],
                ),
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