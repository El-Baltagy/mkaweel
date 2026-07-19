part of '../project_details_screen.dart';

class _PhaseCard extends StatelessWidget {
  const _PhaseCard({
    required this.isLoading,
    required this.projectPhaseItem,
    required this.projectsCubit,
  });

  final bool isLoading;

  final ProjectphaseItem projectPhaseItem;
  final ProjectsCubit projectsCubit;

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

            ProgressRow(
              projectPhaseItem: projectPhaseItem,
              isCompleted: projectPhaseItem.progress_percentage == 100,
            ),
            AppPadding.p16.verticalSpace,

            // Navigation button → PhaseProgress screen
            Semantics(
              label: 'progress_history'.tr(),
              button: true,
              child: SizedBox(
                width: double.infinity,
                height: AppSizes.s48,
                child: Row(
                  children: [
                    Expanded(
                      child: BuildPhaseBtn(
                        title: 'edit_phase'.tr(),
                        icon: Icons.edit,
                        onPressed: () {
                          context.push(
                            PhaseProgressRoute(
                              args: PhaseProgressRouteArgs(
                                projectPhaseItem: projectPhaseItem,
                                projectsCubit: projectsCubit,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: BuildPhaseBtn(
                        title: 'view_tasks'.tr(),
                        icon: Icons.task,
                        onPressed: () {
                          context.push(TasksRoute(args: .new()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppPadding.p8.verticalSpace,
            Semantics(
              label: 'view_updates_and_progress'.tr(),
              button: true,
              child: BuildPhaseBtn(
                title: 'view_updates_and_progress'.tr(),
                icon: Icons.remove_red_eye_outlined,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.s8),
                  ),
                  backgroundColor: AppColors.primaryLightColor,
                  foregroundColor: AppColors.lightBackground,
                  textStyle: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.lightBackground,
                  ),
                ),
                onPressed: () {
                  context.push(
                    ProjectPhaseUpdateRoute(
                      args: ProjectPhaseUpdateRouteArgs(
                        phaseId: projectPhaseItem.id,
                        projectsCubit: projectsCubit,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
