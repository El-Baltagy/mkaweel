part of '../project_invoices_screen.dart';

class _ErrorItem extends StatelessWidget {
  const _ErrorItem({super.key, required this.isDark, required this.errorState, required this.onPressed});
  final bool isDark;
  final   ErrorState errorState ;
  final   void Function()  onPressed ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: AppSizes.s60,
            color: AppColors.secondryLightColor,
          ),
          AppPadding.p12.verticalSpace,
          Text(
            errorState.failure.message ?? 'error_occurred'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          AppPadding.p16.verticalSpace,
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh_rounded),
            label: Text('retry_again'.tr()),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLightColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.s12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

