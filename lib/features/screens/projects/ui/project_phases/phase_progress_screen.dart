import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/methods/date_helper.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/update_phase_parameter.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/start_end_date.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/title_with_input.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mkaweel/core/shared/methods/image_picker.dart';
import 'package:mkaweel/core/shared/widgets/dialouge_choose_image.dart';
import 'package:mkaweel/features/screens/projects/ui/project_details/widgets/progress_text.dart';

part 'phase_progress_mixin.dart';

part 'widgets/update_progress_form.dart';

part 'widgets/update_photo_section.dart';

part 'widgets/save_button.dart';

part 'widgets/full_screen_preview.dart';

part 'widgets/thumbnail_image.dart';

@RoutePage()
class PhaseProgressPage extends StatefulWidget implements AutoRouteWrapper {
  const PhaseProgressPage({super.key, required this.args});

  final PhaseProgressRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.projectsCubit, child: this);
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
        appBar: CustomAppBar(title: args.projectPhaseItem.name),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: _buildCard(
            Form(
              key: _key,
              child: Column(
                spacing: AppPadding.p18,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Percentage field
                  _ProgressPercentageField(progressValue),
                  TitleWithInputField(
                    'update_date_label'.tr(),
                    DOPInputData(
                      field: listFiels[0],
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _updateDateController.text
                              .trim()
                              .isEmpty
                              ? DateTime.now()
                              : DateTime.parse(_updateDateController.text),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() {
                            _updateDateController.text =
                            DateTimeHelper.convertDateIntoCustomString(
                              date,
                            )!;
                          });
                        }
                      },
                      controller: _updateDateController,
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
                  _UploadPhotosSection(imagesListNotifier),
                  TitleWithInputField(
                    'notes_label'.tr(),
                    NameInputData(
                      isLabel: false,
                      maxLines: 3,
                      widgetPrefix: const SizedBox.shrink(),
                      validator: (v) => null,
                      labelText: 'notes_hint'.tr() + "...",
                      controller: _controllerDesc,
                    ),
                  ),
                  // Submit button submit_progress_update
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child:
                    BlocBuilder<ProjectsCubit, ProjectsState>(
                      builder: (context, state) {
                        bool isLoading = state is ProjectsLoaded &&state.updatePhaseState is Loading;

                        return _SavePhaseDatesButton(
                          'submit_progress_update'.tr(),
                          updateAction,
                          isLoading: isLoading,
                        );
                      },
                    )
                  ),
                ],
              ),
            ),
          ),
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
