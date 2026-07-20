import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/password_text_input_data.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/title_with_input.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_state.dart';
import 'package:mkaweel/features/screens/settings/data/model/delete_account_res/delete_account_res.dart';
 part 'change_password_screen_mixin.dart';

@RoutePage()
class ChangePasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const ChangePasswordPage({super.key, required this.args});
  final ChangePasswordRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.settingsCubit,
    child: this,
    );

  }

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ChangePasswordPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'change_password'.tr(),
      ),
      bottomNavigationBar:buildSaveBtn() ,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            spacing: 16,
            children: [
              buildOldPW(),
              buildNewPW(),
              buildNewPWConfirm(),

            ],
          ),
        ),
      ),
    );
  }

  Padding buildSaveBtn() {
    return Padding(
      padding: const  .all(20),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if(state is ChangePasswordState){
            if(state.baseEmit  is Success<DeleteAccountRes>) {
              final DeleteAccountRes data=(state.baseEmit as Success<DeleteAccountRes>).data!;
              if(data.status=='success'){
                context.showToast(data.message);
                context.pushAndPopUntil(MainHomeRoute(args: .new()), predicate: (route) => false,);
              }
          }

            if(state.baseEmit  is ErrorState){
              final ErrorState f=state.baseEmit as ErrorState  ;
               context.showToast(f.failure.message,
              isSuccess: false
              );
          }

          }
        },
        builder: (context, state) {
           bool isLoading=state is ChangePasswordState && state.baseEmit is Loading;

          return isLoading?
          const Row(
            mainAxisAlignment: .center,
            children: [
              CircularProgressIndicator(),
            ],
          ):
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: changePassword ,
               style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
              ),
              child: Text(
                'save'.tr(),
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: context.theme.scaffoldBackgroundColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TitleWithInputField buildOldPW() {
    return TitleWithInputField(
      'old_password'.tr(),
      PasswordInputData(
        isLabel: false,
        field: listFields[0],
        labelText: '*************',
        controller: _oldPWController,
      ),
    );
  }

  TitleWithInputField buildNewPW() {
    return TitleWithInputField(
      'new_password'.tr(),
      PasswordInputData(
        isLabel: false,
        field: listFields[1],
        labelText: 'enter_new_password'.tr(),
        controller: _newPWController,
      ),
    );
  }

  TitleWithInputField buildNewPWConfirm() {
    return TitleWithInputField(
      'new_password_confirm'.tr(),
      PasswordInputData(
        additionalValidator: (value) {
          if (value?.trim() != _newPWController.text.trim()) {
            return 'new_password_and_new_confirm_password_must_be_identical'.tr();
          }
          return null;
        },
        isLabel: false,
        field: listFields[2],
        labelText: 'enter_new_password_confirm'.tr(),
        controller: _newPWConfirmController,
      ),
    );
  }



}
