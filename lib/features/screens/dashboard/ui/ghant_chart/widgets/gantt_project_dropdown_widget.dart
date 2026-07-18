import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_data.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';

class GanttProjectDropdownWidget extends StatefulWidget {
  const GanttProjectDropdownWidget({super.key});

  @override
  State<GanttProjectDropdownWidget> createState() => _GanttProjectDropdownWidgetState();
}

class _GanttProjectDropdownWidgetState extends State<GanttProjectDropdownWidget> {
  String? _selectedProjectId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state is ProjectsLoaded) {
          final emitState = state.allProjectsResState;

          if (emitState is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (emitState is Success<AllProjectsRes>) {
            final projects = emitState.data?.data ?? [];

            if (projects.isEmpty) {
              return Text('no_projects_found'.tr(), style: AppTextStyles.font14Regular);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'select_analysis_scope'.tr(  ),
                  style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primaryLightColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedProjectId,
                      hint: Text(
                        'choose_project'.tr(
                          //defaultValue: 'Choose Project'
                        ),
                        style: AppTextStyles.font14Regular,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.primaryLightColor),
                      items: projects.map((project) {
                        return DropdownMenuItem<String>(
                          value: project.id.toString(),
                          child: Text(
                            project.name ?? 'Unknown',
                            style: AppTextStyles.font14Regular.copyWith(color: AppColors.lightTextPrimary),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedProjectId = value;
                          });
                          DashboardCubit.get(context: context).getGhantDataFunc(
                            parameter: GhantParameter(value),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
