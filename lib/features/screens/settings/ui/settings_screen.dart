import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_state.dart';
import 'package:mkaweel/features/screens/settings/data/model/delete_account_res/delete_account_res.dart';
import 'package:mkaweel/features/screens/settings/data/model/logout_res/logout_res.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/settings/ui/profile_screen.dart';
import 'package:mkaweel/features/screens/settings/ui/widgets/lang_sheet.dart';
 part 'widgets/setting_item.dart';

@RoutePage()
class SettingsPage extends StatefulWidget implements AutoRouteWrapper {
  const SettingsPage({super.key, required this.args});
  final SettingsRouteArgs args ;
//BaseUserType
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) => SettingsCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends SettingsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: settingListener,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: widget.args.baseUserType.title.tr(),
           ),
        body:   SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              children: [
                const SizedBox(height: AppSizes.s12),
                // Info items
                Container(
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(AppSizes.s12),
                    border: Border.all(color: context.theme.canvasColor),
                  ),
                  child: Column(
                    children: [
                      ...widget.args.baseUserType.buildSettingItems(context),
                      SettingItem(
                        icon: Icons.language,
                        title: 'language'.tr(),
                        subtitle: 'choose_language'.tr(),
                        iconColor: Theme.of(context).primaryColor,
                        onTap: const LangSheet().show,
                      ),
                      SettingItem(
                        icon: Icons.info_outline,
                        title: 'about_app'.tr(),
                        subtitle: 'version'.tr(),
                        iconColor: Theme.of(context).primaryColor,
                      ),
                      SettingItem(
                        icon: Icons.shield_outlined,
                        title: 'privacy_policy'.tr(),
                        iconColor: Theme.of(context).primaryColor,
                      ),
                      SettingItem(
                        icon: Icons.help_outline,
                        title: 'help_and_support'.tr(),
                        iconColor: Theme.of(context).primaryColor,
                        showDivider: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.s24),
                // Logout button
                buildLogout(),
                AppSizes.s16.verticalSpace,
                buildDeleteAccount(),
              ],
            ),
          )
        ),
      ),
    );
  }

  BlocBuilder<SettingsCubit, SettingsState> buildDeleteAccount() {
    return BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  bool isLoading=state is DeleteAccountResState && state.baseEmit is Loading;
                  return isLoading?
                  buildLoading():SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async=>await  settingsCubit.deleteAccountFunc( ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: context.theme.colorScheme.secondary,
                        side:   BorderSide(color: context.theme.scaffoldBackgroundColor),
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.s12),
                        ),
                      ),
                      child: Text(
                        'delete_account'.tr(),
                        style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor),
                      ),
                    ),
                  );
                },
              );
  }

  BlocBuilder<SettingsCubit, SettingsState> buildLogout() {
    return BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  bool isLoading=state is LogoutResState && state.baseEmit is Loading;
                  return isLoading?
                  buildLoading():SizedBox(
                    width: double.infinity,
                    child:
                    OutlinedButton(
                      onPressed: () async=>await  settingsCubit.logoutFunc( ),
                      style: OutlinedButton.styleFrom(
                        side:   BorderSide(color: context.theme.colorScheme.secondary),
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.s12),
                        ),
                      ),
                      child:  Text(
                        'logout'.tr(),
                        style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.colorScheme.secondary),
                      ),
                    ),
                  );
                },
              );
  }

  Row buildLoading() {
    return const Row(
      mainAxisAlignment: .center,
      children: [
        CircularProgressIndicator(),
      ],
    );
  }


}


abstract class SettingsPageBaseState extends State<SettingsPage> {
  late final SettingsCubit settingsCubit;

  @override
  void initState() {
    super.initState();
    settingsCubit = SettingsCubit.get(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void settingListener(BuildContext context,SettingsState state) {

    if(state is LogoutResState){
      if(state.baseEmit  is Success<LogoutRes>) {
        final LogoutRes data=(state.baseEmit as Success<LogoutRes>).data!;
        actionOnDeleteAccountORLogout(data.message);
      }
     }
    if(state is DeleteAccountResState){
      if(state.baseEmit  is Success<DeleteAccountRes>) {
        final DeleteAccountRes data=(state.baseEmit as Success<DeleteAccountRes>).data!;
        if(data.status=='success'){
          actionOnDeleteAccountORLogout(data.message);
        }
      }
    }
  }
  void actionOnDeleteAccountORLogout(String message){
    context.showToast(
        message
    );
    StorageHelper.deleteUserData().whenComplete(() {
     if(mounted) context.pushAndPopUntil( const LoginRoute(), predicate: (Route<dynamic> route)=>false);
    },);
  }
}
