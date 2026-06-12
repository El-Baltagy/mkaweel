import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/theming/theme_cubit.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/settings/ui/widgets/lang_sheet.dart';

class SettingsListWidget extends StatefulWidget {
  const SettingsListWidget({super.key});

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
          // Dark Mode Card
          if(false)
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color ?? AppColors.contractorSurface,
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                  border: Border.all(
                    color: Theme.of(context).dividerTheme.color ?? AppColors.contractorLightGrey,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16,
                    vertical: AppPadding.p8,
                  ),
                  leading: Switch(
                    value: isDark,
                    onChanged: (v) => context.read<ThemeCubit>().toggleTheme(v),
                    activeThumbColor: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'dark_mode'.tr(),
                    style: AppTextStyles.font16SemiBold,
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Text(
                    'dark_mode_subtitle'.tr(),
                    style: AppTextStyles.font12Regular,
                    textAlign: TextAlign.right,
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(AppSizes.s8),
                    ),
                    child: Icon(
                      isDark ? Icons.nights_stay_outlined : Icons.wb_sunny_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: AppSizes.s12),
          // Info items
          Container(
            decoration: BoxDecoration(
              color: AppColors.contractorSurface,
              borderRadius: BorderRadius.circular(AppSizes.s12),
              border: Border.all(color: AppColors.contractorLightGrey),
            ),
            child: Column(
              children: [
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
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () =>context.pushAndPopUntil( const LoginRoute(), predicate: (Route<dynamic> route)=>false),
              style: OutlinedButton.styleFrom(
                side:   BorderSide(color: context.theme.colorScheme.secondary),
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
              ),
              child: Text(
                'logout'.tr(),
                style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.colorScheme.secondary),
              ),
            ),
          ),
        ],
      ),
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
          const Divider(height: 1, indent: 16, endIndent: 16, color: AppColors.contractorLightGrey),
      ],
    );
  }
}
