import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/password_text_input_data.dart';
import 'package:mkaweel/features/screens/create_project/ui/widgets/title_with_input.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
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
    return MultiBlocProvider(providers: [
      BlocProvider<WorkersCubit>(
        // Use your singleton to get the Cubit instance
        create: (context) => WorkersCubit(AppLocator()()()),
      ),
      BlocProvider<ProjectsCubit>(
        // Use your singleton to get the Cubit instance
        create: (context) => ProjectsCubit(AppLocator()()())..getAllProjectsFunc(),
      ),


    ], child: this);
  }

  @override
  State<AddWorkerPage> createState() => _AddWorkerPageState();
}

class _AddWorkerPageState extends AddWorkerPageBaseState {

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkersCubit, WorkersState>(
      listener: (context, state) {
        // TODO: implement listener}
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          title: Text(
            widget.args.workerId != null
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
          child: ListView(
            padding: const EdgeInsets.all(AppPadding.p20),
            children: [

              buildName(),
              AppSizes.s16.verticalSpace,

              buildEmail(),
              AppSizes.s16.verticalSpace,

              buildPW(),
              AppSizes.s16.verticalSpace,

              buildPWConfirm(),
              AppSizes.s16.verticalSpace,

              buildRole(),
              AppSizes.s16.verticalSpace,

              buildSpecialization(),
              AppSizes.s16.verticalSpace,

               buildPhone(),
              AppSizes.s16.verticalSpace,

              buildDOB(context),
              AppSizes.s16.verticalSpace,

              buildPJBlocPSelector(),
              AppSizes.s16.verticalSpace,


              AppSizes.s24.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<WorkersCubit, WorkersState>(
                  builder: (context, state) {
                    bool isLoading = false;
                    return ElevatedButton(
                      onPressed: () => addUpdateWorker(isLoading),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme
                            .of(context)
                            .primaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.s12),
                        ),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(
                        color: context.theme.scaffoldBackgroundColor,
                      )
                          : Text(
                        'save'.tr(),
                        style: AppTextStyles.font16SemiBold.copyWith(
                          color: context.theme.scaffoldBackgroundColor,
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
    );
  }

  TitleWithInputField buildPhone() {
    return TitleWithInputField(
              'phone_number'.tr(),
              NameInputData(
                isLabel: false,
                widgetPrefix: const SizedBox.shrink(),
                labelText: '+966 5x xxx xxxx',
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
                controller: .new(),
              ),
            );
  }

  BottomSheetSelector buildRole() {
    return BottomSheetSelector(
              field: field5,
              isMultiSelect: true,
              title: 'role'.tr() + " / " + "access_level".tr(),
              listChoices: listChoices,
              selectedRoleNotifier: _roleIndexesNotifier,
            );
  }

  TitleWithInputField buildPWConfirm() {
    return TitleWithInputField(
              'confirm_password'.tr(),
              PasswordInputData(
                isLabel: false,
                field: field4,
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
                field: field3,
                labelText: '*************',
                controller: _pwController,
              ),
            );
  }

  TitleWithInputField buildEmail() {
    return TitleWithInputField(
              'email'.tr(),
              NameInputData(
                isLabel: false,
                widgetPrefix: const SizedBox.shrink(),
                field: field2,
                labelText: 'email@gmail.com'.tr(),
                controller: _emailController,
              ),
            );
  }

  TitleWithInputField buildName() {
    return TitleWithInputField(
              'worker_name'.tr(),
              NameInputData(
                isLabel: false,
                widgetPrefix: const SizedBox.shrink(),
                field: field1,
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
                  DateTime _initialDate = DateTime.now();
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1950),
                    firstDate: _initialDate,

                    lastDate: _initialDate,
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

  BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?> buildPJBlocPSelector() {
    return BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
              selector: (state)=>state is ProjectsLoaded?state .allProjectsResState:null,

              builder: (context, state) {
                bool isLoading=state is! Success<AllProjectsRes?> ;
                pjChoices=(isLoading?null: state.data?.data.map((e) =>
                    UIApiKeys(e.name, e.id.toString())
                ).toList())??[];
                return BottomSheetSelector(
                  isMultiSelect: true,
                  title: "projects".tr(),
                  listChoices: pjChoices,
                  selectedRoleNotifier: _projectIdsNotifier,
                );
              },
            );
  }
}


