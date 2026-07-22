import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_data.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/widgets/drop_down_role_selector.dart';

class GanttProjectDropdownWidget extends StatefulWidget {
  const GanttProjectDropdownWidget({super.key});

  @override
  State<GanttProjectDropdownWidget> createState() => _GanttProjectDropdownWidgetState();
}

class _GanttProjectDropdownWidgetState extends State<GanttProjectDropdownWidget> {
  final ValueNotifier<List<int>> _selectedProjectNotifier = ValueNotifier<List<int>>([]);
  List<ProjectInfoData> _currentProjects = []; // Store to access in listener

  @override
  void initState() {
    super.initState();
    _selectedProjectNotifier.addListener(_onProjectSelected);
  }

  @override
  void dispose() {
    _selectedProjectNotifier.removeListener(_onProjectSelected);
    _selectedProjectNotifier.dispose();
    super.dispose();
  }

  void _onProjectSelected() {
    if (_selectedProjectNotifier.value.isNotEmpty) {
      final selectedIndex = _selectedProjectNotifier.value.first;
      if (selectedIndex >= 0 && selectedIndex < _currentProjects.length) {
        final projectId = _currentProjects[selectedIndex].id.toString();
        DashboardCubit.get(context: context).getGhantDataFunc(
          parameter: GhantParameter(projectId),
        );
      }
    }
  }

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
            _currentProjects = emitState.data?.data ?? [];

            if (_currentProjects.isEmpty) {
              return Text('no_projects_found'.tr(), style: AppTextStyles.font14Regular);
            }

            return BottomSheetSelector(
              title: 'select_analysis_scope'.tr(),
              isMultiSelect: false,
              listChoices: _currentProjects.map((e) => UIApiKeys(e.name  , e.id.toString())).toList(),
              selectedNotifier: _selectedProjectNotifier,
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
