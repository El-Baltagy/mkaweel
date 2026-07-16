import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/methods/location_Service.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
  import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/location_selection.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/start_end_date.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/title_with_input.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/widgets/drop_down_role_selector.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'create_project_state.dart';

@RoutePage()
class CreateProjectPage extends StatefulWidget implements AutoRouteWrapper {
  const CreateProjectPage({super.key, required this.args});

  /// if this has id ==>update otherwise this is add
  final CreateProjectRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.projectsCubit,
    child: this,
    );

  }

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends CreateProjectPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: createProjectLisener,
      child: Semantics(
        label: 'Create Project Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.primaryColor,
            title: Text(
              widget.args.projectId != null
                  ? 'update_project'.tr()
                  : 'new_project'.tr(),
              style: AppTextStyles.font18SemiBold.copyWith(
                color: context.theme.scaffoldBackgroundColor,
              ),
            ),
            centerTitle: true,
            leading: const SizedBox.shrink(),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: context.theme.scaffoldBackgroundColor,
                ),
                onPressed: () => context.pop(),
              ),
            ],
          ),
          body: ValueListenableBuilder(valueListenable:isLoadingNotifier , builder: (context, value, child) {
            return Form(
              key: _key,
              child:
              value?
              const Center(
                  child: CircularProgressIndicator()):
              SingleChildScrollView(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWithInputField(
                      'project_name'.tr(),
                      NameInputData(
                        isLabel: false,
                        widgetPrefix: const SizedBox.shrink(),
                        field: field1,
                        labelText: 'building_residential_house'.tr(),
                        controller: _controllerName,
                      ),
                    ),

                    20.verticalSpace,
                    TitleWithInputField(
                      'project_owner'.tr(),
                      NameInputData(
                        isLabel: false,
                        widgetPrefix: const SizedBox.shrink(),
                        field: field2,
                        labelText: 'ministry_of_housing'.tr(),
                        controller: _controllerOwner_name,
                      ),
                    ),

                    20.verticalSpace,
                    BottomSheetSelector(
                      field: field5,
                      title:  'currency'.tr(),
                      isMultiSelect: false,
                      listChoices: _listStringCurrencies.map((e) => UIApiKeys(e, e)).toList(),
                      selectedRoleNotifier: selectedCurrencyNotifier,
                    ),


                    20.verticalSpace,
                    TitleWithInputField(
                      '${'contract_value'.tr()} (\$)',
                      NameInputData(
                        isLabel: false,
                         widgetPrefix: const SizedBox.shrink(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            // Allow clearing the field
                            if (newValue.text.isEmpty) {
                              return newValue;
                            }

                            // Prevent entering 0 as the first character
                            if (oldValue.text.isEmpty && newValue.text == '0') {
                              return oldValue;
                            }

                            return newValue;
                          }),
                        ],
                         labelText: '50000',
                        controller: _controllerContract_value,
                      ),
                    ),

                    20.verticalSpace,
                    StartEndDates(
                      controllerE: _controllerEnd_date,
                      controllerS: _controllerStart_date,
                      fieldE: field3,
                      fieldS: field4,
                      titleE: 'end_date'.tr(),
                      titleS: 'start_date'.tr(),
                     ),

                    20.verticalSpace,
                    LoccationSelection(locationNotifier: locationNotifier),

                    20.verticalSpace,
                    TitleWithInputField(
                      'description'.tr(),
                      NameInputData(
                        isLabel: false,
                        widgetPrefix: const SizedBox.shrink(),
                         validator: (v) => null,
                        labelText:
                        'enter_project_scope_and_description'.tr() + "...",
                        controller: _controllerDescription,
                      ),
                    ),

                    20.verticalSpace,
                    TitleWithInputField(
                      'additional_data'.tr() + " / " + 'notes'.tr(),
                      NameInputData(
                        isLabel: false,
                        widgetPrefix: const SizedBox.shrink(),
                         validator: (v) => null,
                        labelText:
                        'any_additional_details_or_requirements'.tr() + "...",
                        controller: _controllerExtra_details,
                      ),
                    ),

                    30.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      height: AppSizes.s48,
                      child: BlocBuilder<ProjectsCubit, ProjectsState>(
                        builder: (context, state) {
                          bool isLoading =
                              state is ProjectsLoaded &&
                                  state.createProjectResState is Loading;
                          return ElevatedButton(
                            onPressed: () => createProject(isLoading),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSizes.s8),
                              ),
                            ),
                            child: isLoading
                                ? CircularProgressIndicator(
                              color: context.theme.scaffoldBackgroundColor,
                            )
                                : Text(
                              widget.args.projectId == null
                                  ? 'create_project'.tr()
                                  : 'save'.tr(),
                              style: AppTextStyles.font16SemiBold.copyWith(
                                color:
                                context.theme.scaffoldBackgroundColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            );
          },),
        ),
      ),
    );
  }


}