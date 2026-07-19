import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/settings/ui/profile_screen.dart';
import 'package:mkaweel/features/screens/settings/ui/settings_screen.dart';


abstract class BaseUserType {
  const BaseUserType({
    required this.title,
  });

  final String title;

  List<SettingItem> buildSettingItems(BuildContext context,SettingsCubit  settingsCubit);
}

class BaseTypeAdmin extends BaseUserType {
  BaseTypeAdmin._() : super(title: 'settings_title');
//._
  static final instance = BaseTypeAdmin._ ();

  @override
  List<SettingItem> buildSettingItems(BuildContext context,SettingsCubit  settingsCubit) {
    return [
      SettingItem(
        icon: Icons.person,
        title: 'personal_profile'.tr(context: context),
        subtitle: 'update_your_personal_profile'.tr(context: context),
        iconColor: context.theme.primaryColor,
        onTap: () => context.pushRoute(    ProfileScreenPageRoute(args:.new(settingsCubit))),
      ),
    ];
  }
}


class BaseTypeWorker extends BaseUserType {
  BaseTypeWorker ._() : super(title: 'home');

  static final instance = BaseTypeWorker._ ();

  @override
  List<SettingItem> buildSettingItems(BuildContext context,SettingsCubit  settingsCubit) {
    return [
      SettingItem(
        icon: Icons.remove_red_eye_outlined,
        title: 'change_password'.tr(context: context),
         iconColor: context.theme.primaryColor,
        onTap: () => context.pushRoute(  ChangePasswordRoute(args: .new(settingsCubit))),
      ),
      SettingItem(
        icon: Icons.task_rounded,
        title: 'tasks'.tr(context: context),
        iconColor: context.theme.primaryColor,
        onTap: () => context.pushRoute(  TasksRoute(args: .new())),
      ),
    ];
  }
}