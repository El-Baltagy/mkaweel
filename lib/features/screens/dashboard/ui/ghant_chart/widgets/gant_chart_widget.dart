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
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'please_select_a_project_from_above'.tr( ),
                  style: AppTextStyles.font14Regular,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (emitState is Loading) {
            return const Center(child: CircularProgressIndicator());
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
                      'project_phase_details'.tr(
                        //defaultValue: 'Project Phase Details'
                      ),
                      style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.contractorGreyText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Progress: ${progress.toStringAsFixed(1)}%',
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
                'error_loading_data'.tr(
                  //defaultValue: 'Failed to load chart data'
                ),
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