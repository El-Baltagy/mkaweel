import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

class SettingsListWidget extends StatefulWidget {
  const SettingsListWidget({super.key});

  @override
  State<SettingsListWidget> createState() => _SettingsListWidgetState();
}

class _SettingsListWidgetState extends State<SettingsListWidget> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        children: [
          // Dark Mode Card
          Container(
            decoration: BoxDecoration(
              color: AppColors.contractorSurface,
              borderRadius: BorderRadius.circular(AppSizes.s12),
              border: Border.all(color: AppColors.contractorLightGrey),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p8,
              ),
              leading: Switch(
                value: _isDarkMode,
                onChanged: (v) => setState(() => _isDarkMode = v),
                activeThumbColor: AppColors.contractorTeal,
              ),
              title: Text('dark_mode'.tr(), style: AppTextStyles.font16SemiBold, textAlign: TextAlign.right),
              subtitle: Text('dark_mode_subtitle'.tr(), style: AppTextStyles.font12Regular, textAlign: TextAlign.right),
              trailing: Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: AppColors.contractorBackground,
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                ),
                child: const Icon(Icons.wb_sunny_outlined, color: AppColors.contractorTeal),
              ),
            ),
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
                  icon: Icons.info_outline,
                  title: 'about_app'.tr(),
                  subtitle: 'version'.tr(),
                  iconColor: AppColors.contractorTeal,
                  showDivider: true,
                ),
                _buildSettingsItem(
                  icon: Icons.shield_outlined,
                  title: 'privacy_policy'.tr(),
                  iconColor: AppColors.contractorTeal,
                  showDivider: true,
                ),
                _buildSettingsItem(
                  icon: Icons.help_outline,
                  title: 'help_and_support'.tr(),
                  iconColor: AppColors.contractorTeal,
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
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.contractorRed),
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
              ),
              child: Text(
                'logout'.tr(),
                style: AppTextStyles.font16SemiBold.copyWith(color: AppColors.contractorRed),
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
    required Color iconColor,
    required bool showDivider,
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
              color: AppColors.contractorBackground,
              borderRadius: BorderRadius.circular(AppSizes.s8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          onTap: () {},
        ),
        if (showDivider)
          const Divider(height: 1, indent: 16, endIndent: 16, color: AppColors.contractorLightGrey),
      ],
    );
  }
}
