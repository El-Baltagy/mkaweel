import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/email_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/password_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/phone_text_input_data.dart';
import 'package:mkaweel/features/screens/create_project/ui/widgets/title_with_input.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/settings/ui/widgets/image_chnager.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/widgets/drop_down_role_selector.dart';
part 'add_workers_sc_mixin.dart';

@RoutePage()
class AddWorkerPage extends StatefulWidget implements AutoRouteWrapper {
  const AddWorkerPage({super.key, required this.args});

  final AddWorkerRouteArgs args;

  // 2. Implement the wrappedRoute method
  @override
  Widget wrappedRoute(BuildContext context) {
     return BlocProvider.value(
value: args.projectsCubit!,
  child: BlocProvider.value(
    value:args.workersCubit! ,
     child: this,
    ),
);

  }

  @override
  State<AddWorkerPage> createState() => _AddWorkerPageState();
}

class _AddWorkerPageState extends AddWorkerPageBaseState {

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkersCubit, WorkersState>(
      listener: listenerWorkersCubit,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          title: Text(
            widget.args.workerItem != null
                ? 'update_worker_data'.tr()
                : 'add_worker'.tr(),
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

        body: Form(
          key: _key,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              spacing: AppSizes.s16,
              crossAxisAlignment:  .start,
              children: [

                Center(
                  child: ImageChange(
                    avatarNotifier: avatarNotifier,
                  ),
                ),

                buildName(),

                buildEmail(),
                if(widget.args.workerItem==null)
                ...[
                  buildPW(),
                   buildPWConfirm()
                ],
                buildRole(),

                buildSpecialization(),

                buildPhone(),

                buildDOB(context),
                
                buildPJBlocPSelector(),

                 Container(
                  margin: const .only(top:AppSizes.s10 ),
                  width: double.infinity,
                  child: BlocBuilder<WorkersCubit, WorkersState>(
                    builder: (context, state) {
                      bool isLoading = state is AllWorkersLoaded &&state.addUpdateWorkerState is Loading;
                      return isLoading
                          ? const Center(
                            child: CircularProgressIndicator(  ),
                          )
                          :SizedBox(
                        // height: 50,
                        child: ElevatedButton(
                          onPressed: () => addUpdateWorker(isLoading),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSizes.s12),
                            ),
                          ),
                          child:  Text(
                                  'save'.tr(),
                                  style: AppTextStyles.font16SemiBold.copyWith(
                                    color: context.theme.scaffoldBackgroundColor,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildPJBlocPSelector() {
    return BottomSheetSelector(
      isMultiSelect: true,
      title: "projects".tr(),
      listChoices: pjChoices,
      selectedRoleNotifier: _projectIdsNotifier,
    );
    // return BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
    //   selector: (state)=>state is ProjectsLoaded?state .allProjectsResState:null,
    //
    //   builder: (context, state) {
    //     bool isLoading=state is! Success<AllProjectsRes?> ;
    //     pjChoices=(isLoading?null: state.data?.data.map((e) =>
    //         UIApiKeys(e.name, e.id.toString())
    //     ).toList())??[];
    //     return BottomSheetSelector(
    //       isMultiSelect: true,
    //       title: "projects".tr(),
    //       listChoices: pjChoices,
    //       selectedRoleNotifier: _projectIdsNotifier,
    //     );
    //   },
    // );
  }
  TitleWithInputField buildPhone() {
    return TitleWithInputField(
              'phone_number'.tr(),
              PhoneInputData(
                isLabel: false,
                 controller: _phoneController,
              ),
            );
  }

  TitleWithInputField buildSpecialization() {
    return TitleWithInputField(
              'specialization'.tr(),
              NameInputData(
                isLabel: false,
                widgetPrefix: const SizedBox.shrink(),
                validator: (v) => null,
                labelText: "${['masonry', 'plumbing', 'electrical'].map((e) =>
                    e.tr()).join(' ,')}...",
                controller: _specController,
              ),
            );
  }

  BottomSheetSelector buildRole() {
    return BottomSheetSelector(
              field: listFields[4],
              isMultiSelect: false,
              title: 'role'.tr() + " / " + "access_level".tr(),
              listChoices: listChoices,
              selectedRoleNotifier: _roleIndexesNotifier,
            );
  }

  TitleWithInputField buildPWConfirm() {
    return TitleWithInputField(
              'confirm_password'.tr(),
              PasswordInputData(
                additionalValidator: (value) {
                  if (value?.trim() != _pwController.text.trim()) {
                    return 'password_and_confirm_password_must_be_identical'.tr();
                  }
                  return null;
                },
                isLabel: false,
                field: listFields[3],
                labelText: '*************',
                controller: _pwConfirmController,
              ),
            );
  }

  TitleWithInputField buildPW() {
    return TitleWithInputField(
              'password'.tr(),
              PasswordInputData(
                isLabel: false,
                field: listFields[2],
                labelText: '*************',
                controller: _pwController,
              ),
            );
  }

  TitleWithInputField buildEmail() {
    return TitleWithInputField(
              'email'.tr(),
              EmailInputData(
                isLabel: false,
                 field: listFields[1],
                labelText: 'email@gmail.com' ,
                controller: _emailController,
              ),
            );
  }
//test@gmail.com
  //building
  TitleWithInputField buildName() {
    return TitleWithInputField(
              'worker_name'.tr(),
              NameInputData(
                isLabel: false,
                widgetPrefix: const SizedBox.shrink(),
                field: listFields[0],
                labelText: 'full_name'.tr(),
                controller: _nameController,
              ),
            );
  }

  TitleWithInputField buildDOB(BuildContext context) {
    return TitleWithInputField(
              'date_of_birth'.tr(),
              DOPInputData(
                fontSize: 13,
                labelText: 'mm/dd/yyyy',
                onTap: () async {
                   final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now() ,
                    firstDate: DateTime(1950),

                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    _dobController.text =
                    "${date.year}-${date.month.toString().padLeft(
                        2, '0')}-${date.day.toString().padLeft(2, '0')}";
                  }
                },
                controller: _dobController,
              ),
            );
  }


}


