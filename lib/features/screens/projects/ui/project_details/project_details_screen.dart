import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
part 'pj_details_mixin.dart';
@RoutePage()
class ProjectDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  const ProjectDetailsPage({super.key, required this.args});

  final ProjectDetailsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.projectsCubit, child: this);
    return BlocProvider<ProjectsCubit>(
      create: (context) => ProjectsCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends ProjectDetailsPageBaseState {


  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar:CustomAppBar(
          title:  'project_overview'.tr(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOverviewCard(),
              AppPadding.p24.verticalSpace,
              Semantics(
                label: 'project_constructionphases',
                child: Text(
                  'project_constructionphases'.tr(),
                  style: AppTextStyles.font18SemiBold,
                ),
              ),
              AppPadding.p16.verticalSpace,
              _buildPhasesList(context),
              AppPadding.p24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewCard() {
    return Semantics(
      label: 'project_overview_card',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(AppSizes.s12),
          border: Border.all(color: AppColors.lightBorder),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: AppSizes.s24,
                  backgroundColor: const Color(0xFFB2DFDB),
                  child: Text(
                    'd',
                    style: AppTextStyles.font18SemiBold.copyWith(
                      color: AppColors.primaryLightColor,
                    ),
                  ),
                ),
                AppPadding.p16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('dfbf', style: AppTextStyles.font18SemiBold),
                      AppPadding.p4.verticalSpace,
                      Text(
                        '${'owner'.tr()}: bbfbfb',
                        style: AppTextStyles.font12Regular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppPadding.p16.verticalSpace,
            Row(
              children: [
                const Icon(
                  Icons.monetization_on_outlined,
                  size: AppSizes.s20,
                  color: AppColors.primaryLightColor,
                ),
                AppPadding.p8.horizontalSpace,
                Text(
                  '${'contract_value'.tr()}: ',
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.lightTextPrimary,
                  ),
                ),
                Text(
                  '6,666.00 EUR',
                  style: AppTextStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryLightColor,
                  ),
                ),
              ],
            ),
            AppPadding.p8.verticalSpace,
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: AppSizes.s20,
                  color: AppColors.primaryLightColor,
                ),
                AppPadding.p8.horizontalSpace,
                Text(
                  '2026-07-07 - 2026-07-07',
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.lightTextSecondary,
                  ),
                ),
              ],
            ),
            AppPadding.p16.verticalSpace,
            Text(
              '${'description'.tr()}:',
              style: AppTextStyles.font14Regular.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.lightTextPrimary,
              ),
            ),
            AppPadding.p4.verticalSpace,
            Text('vv', style: AppTextStyles.font12Regular),
            AppPadding.p16.verticalSpace,
            Text(
              '${'additional_data'.tr()}:',
              style: AppTextStyles.font14Regular.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.lightTextPrimary,
              ),
            ),
            AppPadding.p4.verticalSpace,
            Text('vv', style: AppTextStyles.font12Regular),
          ],
        ),
      ),
    );
  }

  Widget _buildPhasesList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: phases.length,
      separatorBuilder: (_, __) => AppPadding.p12.verticalSpace,
      itemBuilder: (context, index) {
        final phase = phases[index];
        return _PhaseCard(
          title: phase['title']!,
          subtitle: phase['subtitle']!,
          onViewProgress: () {
            // Navigate to PhaseProgress screen passing the phase name
            AppRouterExtension(context).router.push(
              PhaseProgressRoute(
                args: PhaseProgressRouteArgs(phaseName: phase['title']!),
              ),
            );
          },
        );
      },
    );
  }
}

/// Extracted phase card widget.
class _PhaseCard extends StatelessWidget {
  const _PhaseCard({
    required this.title,
    required this.subtitle,
    required this.onViewProgress,
  });

  final String title;
  final String subtitle;
  final VoidCallback onViewProgress;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: title,
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
              title,
              style: AppTextStyles.font16SemiBold.copyWith(
                color: AppColors.primaryLightColor,
              ),
            ),
            AppPadding.p4.verticalSpace,
            Text(subtitle, style: AppTextStyles.font12Regular),
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
                  onPressed: onViewProgress,
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
}


