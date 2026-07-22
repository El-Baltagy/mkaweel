import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
 import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/dummy.dart'  ;
 import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_inoices_res/project_inoices_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/widgets/delete_pj_dialouge.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'project_invoices_screen_mixin.dart';

part 'widgets/invoice_list_item.dart';

part 'widgets/invoice_empty_item.dart';

part 'widgets/invoice_error_item.dart';

@RoutePage()
class ProjectInvoicesPage extends StatefulWidget implements AutoRouteWrapper {
  const ProjectInvoicesPage({super.key, required this.args});

  final ProjectInvoicesRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.projectsCubit, child: this);
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


            if (invoicesState is ErrorState) {
              return _ErrorItem(errorState: invoicesState,
                  isDark: isDark,
                  onPressed: _fetchInvoices);
            }
            bool isLoading = invoicesState is Loading;
            final List<InvoiceItem> items =
            isLoading ?
            List.generate(5, (index) => emptyInvoice) :
            invoicesState is Success<ProjectInoicesRes>
                ? (invoicesState.data?.data.invoices ?? [])
                : [];

            if (items.isEmpty && invoicesState != null) {
              return _EmptyItem(isDark: isDark);
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p20,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Skeletonizer(
                  enabled: isLoading,
                  child: _InvoiceListItem(
                    projectsCubit: projectsCubit,
                    item: item,
                    isDark: isDark,
                  )
                );
              },
            );

          },
        ),
      ),
    );
  }

}