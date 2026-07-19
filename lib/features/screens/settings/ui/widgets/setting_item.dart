part of '../settings_screen.dart';
class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.icon, required this.title, this.subtitle, this.onTap, required this.iconColor,   this.showDivider=true});
  final IconData icon;
  final String title;
      final String? subtitle;
  final  void Function()? onTap;
  final Color iconColor;
  final  bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p4),
          title: Text(title, style: AppTextStyles.font16SemiBold, textAlign: TextAlign.right),
          subtitle: subtitle != null
              ? Text(subtitle!, style: AppTextStyles.font12Regular, textAlign: TextAlign.right)
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
