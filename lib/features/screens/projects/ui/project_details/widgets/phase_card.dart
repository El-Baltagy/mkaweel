part of '../project_details_screen.dart';

class _PhaseCard extends StatelessWidget {
  const _PhaseCard({
    required this.projectPhaseItem,
   });

  final ProjectphaseItem projectPhaseItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(AppSizes.s10),
        border: Border.all(color: AppColors.lightBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            projectPhaseItem.name,
            style: AppTextStyles.font16SemiBold.copyWith(
              color: AppColors.primaryLightColor,
            ),
          ),
          if(projectPhaseItem.description!=null)
          ...[
            AppPadding.p4.verticalSpace,
            Text(projectPhaseItem.description!, style: AppTextStyles.font12Regular),
          ],
          const Divider(height: AppSizes.s24, color: AppColors.lightBorder),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'planned_start_date'.tr(),
                    style: AppTextStyles.font12Regular,
                  ),
                  AppPadding.p2.verticalSpace,
                  Text(
                    '2026-07-07 / 2028-07-07',
                    style: AppTextStyles.font12Regular.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightTextPrimary,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'actual_start_date'.tr(),
                    style: AppTextStyles.font12Regular,
                  ),
                  AppPadding.p2.verticalSpace,
                  Text(
                    '- / -',
                    style: AppTextStyles.font12Regular.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightTextPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppPadding.p12.verticalSpace,
          Row(
            children: [
              Text(
                'progress_percentage'.tr(),
                style: AppTextStyles.font12Regular,
              ),
              AppPadding.p8.horizontalSpace,
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.s4),
                  child: const LinearProgressIndicator(
                    value: 0.0,
                    backgroundColor: AppColors.lightBorder,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryLightColor,
                    ),
                    minHeight: AppSizes.s8,
                  ),
                ),
              ),
              AppPadding.p8.horizontalSpace,
              Text(
                '0%',
                style: AppTextStyles.font12Regular.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightTextPrimary,
                ),
              ),
              AppPadding.p12.horizontalSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p8,
                  vertical: AppPadding.p4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(AppSizes.s4),
                  border: Border.all(color: AppColors.lightBorder),
                ),
                child: Text(
                  'pending_status'.tr(),
                  style: AppTextStyles.font12Regular,
                ),
              ),
            ],
          ),
          AppPadding.p16.verticalSpace,
          // Navigation button → PhaseProgress screen
          Semantics(
            label: 'view_updates_and_progress'.tr(),
            button: true,
            child: SizedBox(
              width: double.infinity,
              height: AppSizes.s48,
              child: ElevatedButton.icon(
                onPressed: () {
                  // AppRouterExtension(context).router.push(
                  //   PhaseProgressRoute(
                  //     args: PhaseProgressRouteArgs(phaseName: phase['title']!),
                  //   ),
                  // );
                },
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  size: AppSizes.s18,
                ),
                label: Text('view_updates_and_progress'.tr()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryLightColor,
                  foregroundColor: AppColors.lightBackground,
                  textStyle: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.lightBackground,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.s8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}