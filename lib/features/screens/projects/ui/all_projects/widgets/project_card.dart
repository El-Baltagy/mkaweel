import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/methods/location_Service.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
  import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/location_selection.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/widgets/delete_pj_dialouge.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'info_row.dart';

part 'location_row.dart';


class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectInfoData,
    required this.projectsCubit,
    this.showEditDeleTasksBtns = true,
    this.margin,
  });

  final ProjectInfoData projectInfoData;
  final ProjectsCubit projectsCubit;
  final bool showEditDeleTasksBtns;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    final List<PopMenuValues> popupActions = [
      .new(
        widget: Row(
          children: [
            Icon(Icons.edit, color: context.theme.primaryColor),
            const SizedBox(width: 8),
            Text('edit_project'.tr()),
          ],
        ),
        title: 'edit',
        onTap: () async {
          final result = await context.push(
            CreateProjectRoute(
              args: CreateProjectRouteArgs(
                '${projectInfoData.id}',
                projectsCubit,
              ),
            ),
          );
          if (result == true) {
            await projectsCubit.getAllProjectsFunc(Reload());
          }
        },
      ),

      .new(
        widget: Row(
          children: [
            Icon(Icons.delete, color: context.theme.colorScheme.secondary),
            const SizedBox(width: 8),
            Text('delete_project'.tr()),
          ],
        ),
        title: 'delete',
        onTap: DeletePjDialouge(
          title: 'delete_project'.tr(),
          subTitle: 'are_you_sure_you_want_to_delete_this_project'.tr(),
          onPressedDelete: () => projectsCubit.deleteProjectFunc(
            parameter: DeleteProjectParameter(projectInfoData.id.toString()),
          ),
        ).toShowDialouge,
      ),

      .new(
        widget: Row(
          children: [
            Icon(Icons.task_rounded, color: context.theme.primaryColor),
            const SizedBox(width: 8),
            Text('project_tasks'.tr()),
          ],
        ),
        title: 'tasks',
        onTap: () async {
          await context.push(TasksRoute(args: .new()));
        },
      ),
          .new(
        widget: Row(
          children: [
            Icon(Icons.update, color: context.theme.primaryColor),
            const SizedBox(width: 8),
            Text('project_phases'.tr()),
          ],
        ),
        title: 'project_phases',
        onTap: () async {
          await context.push(
            ProjectDetailsRoute(
              args: ProjectDetailsRouteArgs(
                projectsCubit: projectsCubit,
                projectInfoData: projectInfoData,
              ),
            ),
          );
        },
      ),

      PopMenuValues(
        widget: Row(
          children: [
            Icon(Icons.inventory_outlined, color: context.theme.primaryColor),
            const SizedBox(width: 8),
            Text('project_invoices'.tr()),
          ],
        ),
        title: 'project_invoices',
        onTap: () async {
          await context.push(
            ProjectInvoicesRoute(
              args: .new(
               projectsCubit,
               ),
            ),
          );
        },
      ),
    ];

    return Card(
      elevation: 2,
      margin: margin,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const  .fromSTEB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: primary.withOpacity(.1),
                  child: Icon(Icons.business_center, color: primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        // 'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
                        projectInfoData.name,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'owner'.tr() + ' : ${projectInfoData.owner_name}',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),

                /// here add pop up menu button
                PopupMenuButton<String>(
                  icon:   Icon(Icons.more_vert,
                  color: context.theme.primaryColor,
                  ),
                  onSelected: (value) {
                    final action = popupActions.firstWhere(
                      (element) => element.title == value,
                    );
                    action.onTap();
                  },
                  itemBuilder: (context) => popupActions
                      .map(
                        (e) => PopupMenuItem(value: e.title, child: e.widget),
                      )
                      .toList(),
                ),
              ],
            ),
            Padding(
              padding: const  .fromSTEB(0, 0, 16, 0),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  /// Progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'progress_percentage'.tr(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('${projectInfoData.progress_percentage}%'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: projectInfoData.progress_percentage / 100,
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 8,
                    backgroundColor: AppColors.lightBorder,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primaryLightColor,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Dates
                  Row(
                    children: [
                      Expanded(
                        child: _InfoTile(
                          Icons.calendar_today,
                          'start'.tr(),
                          projectInfoData.start_date,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _InfoTile(
                          Icons.event,
                          'end'.tr(),
                          projectInfoData.end_date,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  /// Contract
                  if (projectInfoData.contract_value != null) ...[
                    InfoRow(
                      Icons.payments,
                      'contract_value'.tr(),
                      '${projectInfoData.contract_value} ${projectInfoData.currency}',
                    ),

                    const SizedBox(height: 10),
                  ],

                  /// Location
                  LocationRow(projectInfoData: projectInfoData),
                  if (projectInfoData.description != null ||
                      projectInfoData.extra_details != null)
                    const Divider(height: 28),

                  if (projectInfoData.description != null) ...[
                    Text(
                      'description'.tr(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(projectInfoData.description!),
                  ],

                  if (projectInfoData.extra_details != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      'extra_details'.tr(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(projectInfoData.extra_details!),
                  ],
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.icon, this.title, this.value);

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}


class PopMenuValues {
  PopMenuValues({
    required this.widget,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Widget widget;
  final void Function() onTap;
}
