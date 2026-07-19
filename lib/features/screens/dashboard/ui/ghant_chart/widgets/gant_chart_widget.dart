part of '../gant_chart_screen.dart';
class GhantChart extends StatelessWidget {
  const GhantChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoaded) {
          final emitState = state.getGhantDataState;

          if (emitState == null) {
            return Padding(
              padding: const EdgeInsets.all(32.0).copyWith(
                top: context.height*0.3
              ),
              child: Text(
                'please_select_a_project_from_above'.tr( ),
                style: AppTextStyles.font16SemiBold,
                textAlign:  .center,
              ),
            );
          }

          if (emitState is Loading ) {
            return   Padding(
                padding:   EdgeInsets. only(
                    top: context.height*0.25
                ),
              child: const CircularProgressIndicator(),
            );
          }

          if (emitState is Success<GhantRes>) {
            final data = emitState.data;
            final phases = data?.data.selected_project.phases ?? [];
            final progress = data?.data.selected_project.progress_percentage ?? 0.0;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'project_phase_details'.tr( ),
                      style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.contractorGreyText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                     'progress_percentage_label'.tr()+ ': ${progress.toStringAsFixed(1)}%',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.contractorGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,
                CustomBarChartWidget(phases: phases),
              ],
            );
          }

          if (emitState is ErrorState) {
            return Center(
              child: Text(
                'error_loading_data'.tr(  ),
                style: AppTextStyles.font14Regular.copyWith(color: AppColors.red),
              ),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}