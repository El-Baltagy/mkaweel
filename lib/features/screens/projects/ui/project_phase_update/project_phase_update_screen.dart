import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/pj_phase_update/pj_phase_update.dart';
import 'package:mkaweel/features/screens/projects/data/model/get_project_data_parameter.dart';
import 'package:easy_localization/easy_localization.dart';

part 'project_phase_update_screen_mixin.dart';

part 'widgets/progress_history_item.dart';

part 'widgets/photo_gallery.dart';

@RoutePage()
class ProjectPhaseUpdatePage extends StatefulWidget
    implements AutoRouteWrapper {
  const ProjectPhaseUpdatePage({super.key, required this.args});

  final ProjectPhaseUpdateRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.projectsCubit, child: this);
  }

  @override
  State<ProjectPhaseUpdatePage> createState() => _ProjectPhaseUpdatePageState();
}

class _ProjectPhaseUpdatePageState extends ProjectPhaseUpdatePageBaseState {
  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;

    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: (context, state) {
        // listener reserved for future use
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(title: 'progress_history'.tr()),
        body: BlocBuilder<ProjectsCubit, ProjectsState>(
          builder: (context, state) {
            final phaseUpdateState = state is ProjectsLoaded
                ? state.getPjPhaseUpdateState
                : null;

            if (phaseUpdateState is Loading) {
              return _buildSkeletonLoader(isDark);
            }

            if (phaseUpdateState is ErrorState) {
              return _buildError(context, phaseUpdateState, isDark);
            }

            final List<ProgressupdateItem> items =
                phaseUpdateState is Success<PjPhaseUpdate>?
                 // List<ProgressupdateItem>.generate(
                 //    4,
                 //    (index) => ProgressupdateItem(
                 //      id: index,
                 //      progress_percentage: 10,
                 //      update_date: '12-10-2020',
                 //      notes: '144',
                 //      photos: ['https://muqawili.app/public/assets/images/users/avatar-1.jpg'],
                 //      creator_name: '1255',
                 //    ),
                 //  )
                  (phaseUpdateState.data?.data.progress_updates ?? [])
                : [];

            if (items.isEmpty && phaseUpdateState != null) {
              return _buildEmpty(context, isDark);
            }

            if (items.isEmpty) {
              return _buildSkeletonLoader(isDark);
            }

            return _buildTimeline(context, items, isDark);
          },
        ),
      ),
    );
  }

  Widget _buildTimeline(
    BuildContext context,
    List<ProgressupdateItem> items,
    bool isDark,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p20,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isLast = index == items.length - 1;
        return _ProgressHistoryItem(item: item, isLast: isLast, isDark: isDark);
      },
    );
  }

  Widget _buildSkeletonLoader(bool isDark) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p20,
      ),
      itemCount: 3,
      itemBuilder: (context, index) => _SkeletonHistoryItem(isDark: isDark),
    );
  }

  Widget _buildError(BuildContext context, ErrorState errorState, bool isDark) {
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
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          AppPadding.p16.verticalSpace,
          ElevatedButton.icon(
            onPressed: _fetchHistory,
            icon: const Icon(Icons.refresh_rounded),
            label: Text('retry'.tr()),
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

  Widget _buildEmpty(BuildContext context, bool isDark) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.history_rounded,
            size: AppSizes.s80,
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
          AppPadding.p12.verticalSpace,
          Text(
            'no_progress_updates'.tr(),
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

// ─── Skeleton loader item ────────────────────────────────────────────────────

class _SkeletonHistoryItem extends StatelessWidget {
  const _SkeletonHistoryItem({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final shimmerColor = isDark
        ? const Color(0xFF2D3748)
        : const Color(0xFFE8ECF0);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dot + line
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
              Container(width: 2, height: 160, color: shimmerColor),
            ],
          ),
          AppPadding.p12.horizontalSpace,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : Colors.white,
                borderRadius: BorderRadius.circular(AppSizes.s12),
                border: Border.all(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
              ),
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _shimmerBox(60, 28, shimmerColor, AppSizes.s8),
                      AppPadding.p8.horizontalSpace,
                      _shimmerBox(120, 16, shimmerColor, AppSizes.s4),
                      const Spacer(),
                      _shimmerBox(80, 14, shimmerColor, AppSizes.s4),
                    ],
                  ),
                  AppPadding.p12.verticalSpace,
                  _shimmerBox(double.infinity, 14, shimmerColor, AppSizes.s4),
                  AppPadding.p6.verticalSpace,
                  _shimmerBox(200, 14, shimmerColor, AppSizes.s4),
                  AppPadding.p12.verticalSpace,
                  _shimmerBox(100, 80, shimmerColor, AppSizes.s8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerBox(double width, double height, Color color, double radius) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
      );
}
