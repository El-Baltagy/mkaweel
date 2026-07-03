import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_state.dart';
import 'package:mkaweel/features/screens/settings/data/model/delete_account_res/delete_account_res.dart';
import 'package:mkaweel/features/screens/settings/data/model/logout_res/logout_res.dart';
import 'package:mkaweel/features/screens/settings/ui/widgets/settings_list_widget.dart';
import 'package:mkaweel/core/extension/context.dart';

@RoutePage()
class SettingsPage extends StatefulWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

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
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          title: Text(
            'settings_title'.tr(),
            style: AppTextStyles.font18SemiBold.copyWith(
              color: Theme.of(context).appBarTheme.foregroundColor ?? context.theme.scaffoldBackgroundColor,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body:   SingleChildScrollView(
          child: SettingsListWidget(settingsCubit:settingsCubit),
        ),
      ),
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
