part of '../project_details_screen.dart';

class _PhaseCard extends StatelessWidget {
  const _PhaseCard({required this.isLoading, required this.projectPhaseItem});

  final bool isLoading;

  final ProjectphaseItem projectPhaseItem;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
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
            if (projectPhaseItem.description != null) ...[
              AppPadding.p4.verticalSpace,
              Text(
                projectPhaseItem.description!,
                style: AppTextStyles.font12Regular,
              ),
            ],
            const Divider(height: AppSizes.s24, color: AppColors.lightBorder),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildColumn(
                  'planned_start_date'.tr(),
                  projectPhaseItem.planned_start_date,
                  projectPhaseItem.planned_end_date,
                ),
                buildColumn(
                  'actual_start_date'.tr(),
                  projectPhaseItem.actual_start_date,
                  projectPhaseItem.actual_end_date,
                ),
              ],
            ),
            AppPadding.p12.verticalSpace,

            buildRowProgress(context),
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
                  context.push(  PhaseProgressRoute(
                    args: PhaseProgressRouteArgs(projectPhaseItem:projectPhaseItem ),
                  ));
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
      ),
    );
  }

  Row buildRowProgress(BuildContext context) {
    bool isCompleted = projectPhaseItem.progress_percentage == 100;
    return Row(
      children: [
        Text('progress_percentage'.tr(), style: AppTextStyles.font12Regular),
        AppPadding.p8.horizontalSpace,
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.s4),
            child:   LinearProgressIndicator(
              value:(projectPhaseItem.progress_percentage /100).toDouble() ,
               backgroundColor: AppColors.lightBorder,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryLightColor,
              ),
              minHeight: AppSizes.s8,
            ),
          ),
        ),

        AppPadding.p8.horizontalSpace,
        Text(
          '${projectPhaseItem.progress_percentage} %',
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
            color: isCompleted?
            context.theme.primaryColor:
            AppColors.lightSurface,
            borderRadius: BorderRadius.circular(AppSizes.s4),
            border: Border.all(color: AppColors.lightBorder),
          ),
          child: Text(
            isCompleted
                ? 'completed_status'.tr()
                : 'pending_status'.tr(),
            style: AppTextStyles.font12Regular.copyWith(
              color:
              isCompleted?
              context.theme.scaffoldBackgroundColor    :
              AppColors.contractorGreyText,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildColumn(String title, String? date1, String? date2) {
    if (date1 == null || date2 == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font12Regular),
        AppPadding.p2.verticalSpace,
        Text(
          '${DateTimeHelper.formatDateTimeFromString(date1, DateFormat(DateTimeHelper.formatDateOnly))} : ${DateTimeHelper.formatDateTimeFromString(date2, DateFormat(DateTimeHelper.formatDateOnly))}',
          style: AppTextStyles.font12Regular.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.lightTextPrimary,
          ),
        ),
      ],
    );
  }
}
