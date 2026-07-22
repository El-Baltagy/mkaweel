import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_inoices_res/project_inoices_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/core/base/base_state.dart';
 
part 'project_invoices_screen_mixin.dart';
part 'widgets/invoice_list_item.dart';

@RoutePage()
class ProjectInvoicesPage extends StatefulWidget implements AutoRouteWrapper {
  const ProjectInvoicesPage({super.key, required this.projectsCubit});
  final ProjectsCubit projectsCubit;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: projectsCubit, child: this);
  }

  @override
  State<ProjectInvoicesPage> createState() => _ProjectInvoicesPageState();
}

class _ProjectInvoicesPageState extends ProjectInvoicesPageBaseState {
  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;

    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: 'project_invoices'.tr(),
        ),
        body: BlocBuilder<ProjectsCubit, ProjectsState>(
          builder: (context, state) {
            final invoicesState = state is ProjectsLoaded
                ? state.getProjectInvoicesState
                : null;

            if (invoicesState is Loading) {
              return _buildSkeletonLoader(isDark);
            }

            if (invoicesState is ErrorState) {
              return _buildError(context, invoicesState, isDark);
            }

            final List<InvoiceItem> items =
                invoicesState is Success<ProjectInoicesRes>
                    ? (invoicesState.data?.data.invoices ?? [])
                    : [];

            if (items.isEmpty && invoicesState != null) {
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
    List<InvoiceItem> items,
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
        return _InvoiceListItem(
          item: item,
          isDark: isDark,
        );
      },
    );
  }

  Widget _buildSkeletonLoader(bool isDark) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p20,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => _SkeletonInvoiceItem(isDark: isDark),
    );
  }

  Widget _buildError(
    BuildContext context,
    ErrorState errorState,
    bool isDark,
  ) {
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
            onPressed: _fetchInvoices,
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
            Icons.receipt_long_rounded,
            size: AppSizes.s80,
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
          AppPadding.p12.verticalSpace,
          Text(
            'no_invoices'.tr(),
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

class _SkeletonInvoiceItem extends StatelessWidget {
  const _SkeletonInvoiceItem({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final shimmerColor =
        isDark ? const Color(0xFF2D3748) : const Color(0xFFE8ECF0);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p12),
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
                _shimmerBox(120, 20, shimmerColor, AppSizes.s4),
                const Spacer(),
                _shimmerBox(60, 20, shimmerColor, AppSizes.s4),
              ],
            ),
            AppPadding.p12.verticalSpace,
            _shimmerBox(double.infinity, 14, shimmerColor, AppSizes.s4),
            AppPadding.p6.verticalSpace,
            _shimmerBox(200, 14, shimmerColor, AppSizes.s4),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox(
    double width,
    double height,
    Color color,
    double radius,
  ) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
      );
}
