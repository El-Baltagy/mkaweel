import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/theme_cubit.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_state.dart';
import 'package:mkaweel/features/screens/settings/ui/profile_screen.dart';
import 'package:mkaweel/features/screens/settings/ui/widgets/lang_sheet.dart';

class SettingsListWidget extends StatefulWidget {
  const SettingsListWidget({super.key, required this.settingsCubit});
  final SettingsCubit settingsCubit ;
  @override
  State<SettingsListWidget> createState() => _SettingsListWidgetState();
}

class _SettingsListWidgetState extends State<SettingsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                _buildSettingsItem(
                  icon: Icons.person,
                  title: 'personal_profile'.tr(),
                  subtitle: 'update_your_personal_profile'.tr(),
                  iconColor: Theme.of(context).primaryColor,
                  onTap: ()=>context.pushNavigation(ProfileScreen()),
                ),
                _buildSettingsItem(
                  icon: Icons.language,
                  title: 'language'.tr(),
                  subtitle: 'choose_language'.tr(),
                  iconColor: Theme.of(context).primaryColor,
                  onTap: const LangSheet().show,
                 ),
                _buildSettingsItem(
                  icon: Icons.info_outline,
                  title: 'about_app'.tr(),
                  subtitle: 'version'.tr(),
                  iconColor: Theme.of(context).primaryColor,
                 ),
                _buildSettingsItem(
                  icon: Icons.shield_outlined,
                  title: 'privacy_policy'.tr(),
                  iconColor: Theme.of(context).primaryColor,
                 ),
                _buildSettingsItem(
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
          BlocBuilder<SettingsCubit, SettingsState>(
  builder: (context, state) {
    bool isLoading=state is LogoutResState && state.baseEmit is Loading;
    return isLoading?
    buildRow():SizedBox(
             width: double.infinity,
            child:
            OutlinedButton(
              onPressed: () async=>await widget.settingsCubit.logoutFunc( ),
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
),
          AppSizes.s16.verticalSpace,
          BlocBuilder<SettingsCubit, SettingsState>(
  builder: (context, state) {
    bool isLoading=state is DeleteAccountResState && state.baseEmit is Loading;
    return isLoading?
    buildRow():SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () async=>await widget.settingsCubit.deleteAccountFunc( ),
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
),
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
    mainAxisAlignment: .center,
    children: [
      CircularProgressIndicator(),
    ],
  );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subtitle,
    void Function()? onTap,
    required Color iconColor,
      bool showDivider=true,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p4),
          title: Text(title, style: AppTextStyles.font16SemiBold, textAlign: TextAlign.right),
          subtitle: subtitle != null
              ? Text(subtitle, style: AppTextStyles.font12Regular, textAlign: TextAlign.right)
              : null,
          trailing: Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(AppSizes.s8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          onTap:onTap,
        ),
        if (showDivider)
            Divider(height: 1, indent: 16, endIndent: 16, color: context.theme.canvasColor),
      ],
    );
  }
}
