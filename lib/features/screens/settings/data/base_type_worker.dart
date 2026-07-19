import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/settings/ui/profile_screen.dart';
import 'package:mkaweel/features/screens/settings/ui/settings_screen.dart';


abstract class BaseUserType {
  const BaseUserType({
    required this.title,
  });

  final String title;

  List<SettingItem> buildSettingItems(BuildContext context);
}

class BaseTypeAdmin extends BaseUserType {
  BaseTypeAdmin() : super(title: 'settings');
//._
  static final instance = BaseTypeAdmin ();

  @override
  List<SettingItem> buildSettingItems(BuildContext context) {
    return [
      SettingItem(
        icon: Icons.person,
        title: 'personal_profile'.tr(context: context),
        subtitle: 'update_your_personal_profile'.tr(context: context),
        iconColor: context.theme.primaryColor,
        onTap: () => context.pushNavigation(const ProfileScreen()),
      ),
    ];
  }
}


class BaseTypeWorker extends BaseUserType {
  BaseTypeWorker () : super(title: 'home');

  static final instance = BaseTypeWorker ();

  @override
  List<SettingItem> buildSettingItems(BuildContext context) {
    return [
      SettingItem(
        icon: Icons.person,
        title: 'personal_profile'.tr(context: context),
        subtitle: 'update_your_personal_profile'.tr(context: context),
        iconColor: context.theme.primaryColor,
        onTap: () => context.pushNavigation(const ProfileScreen()),
      ),
    ];
  }
}