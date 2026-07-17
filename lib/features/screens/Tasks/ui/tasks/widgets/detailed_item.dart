part of '../tasks_screen.dart';

class DetailedItem extends StatelessWidget {
  const DetailedItem({
    super.key, required this.icon, required this.title, required this.value,
  });
  final IconData icon;
  final String title,value;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: AppSizes.s16,
          color: AppColors.primaryLightColor,
        ),
        AppPadding.p8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.lightTextSecondary,
                ),
              ),
              AppPadding.p4.verticalSpace,
              Text(
                value,
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}