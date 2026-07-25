import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/main_home/ui/main_home_screen.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
 import 'package:mkaweel/features/screens/settings/ui/settings_screen.dart';


abstract class BaseUserType {
  const BaseUserType({
    required this.title,
  });

  final String title;

  List<SettingItem> buildSettingItems(BuildContext context,SettingsCubit  settingsCubit);
  List< NavItemData> buildRoutesNav( );
}

class BaseTypeAdmin extends BaseUserType {
  BaseTypeAdmin._() : super(title: 'settings_title');
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

  @override
  List<NavItemData> buildRoutesNav() =>[
    NavItemData(icon: Icons.grid_view_rounded, route:   const DashboardRoute(),    label: 'home'.tr()),
    NavItemData(icon: Icons.business_center_outlined,route:   const ProjectsRoute(), label: 'projects_tab'.tr()),
    NavItemData(icon: Icons.trending_up_rounded, route:   const MarketPricesRoute(), label: 'prices_tab'.tr()),
    NavItemData(icon: Icons.group_outlined, route:   const WorkersRoute(),       label: 'workers_tab'.tr()),
    NavItemData(icon: Icons.settings_outlined,route:     SettingsRoute(
        args: .new( this)
    ),     label: 'settings_tab'.tr()),
  ];
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
     ];
  }

  @override
  List<NavItemData> buildRoutesNav() =>[
    NavItemData(icon: Icons.grid_view_rounded, route:     AttendenceRoute(args: const AttendenceRouteArgs()),    label: 'attendence'.tr()),
    NavItemData(icon: Icons.task_sharp, route:     TasksRoute(args: const TasksRouteArgs(
      WorkerTasksData.instance
    )),    label: 'tasks'.tr()),
     NavItemData(icon: Icons.settings_outlined,route:     SettingsRoute(
        args: .new( this)
    ),     label: 'settings_tab'.tr()),
  ];
}