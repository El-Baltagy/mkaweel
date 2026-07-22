part of '../project_invoices_screen.dart';

class _EmptyItem extends StatelessWidget {
  const _EmptyItem({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.receipt_long_rounded,
            size: AppSizes.s80,
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
          AppPadding.p12.verticalSpace,
          Text(
            'there_is_no_invoices'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

