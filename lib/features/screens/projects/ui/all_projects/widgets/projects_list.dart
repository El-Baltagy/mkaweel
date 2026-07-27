import 'package:flutter/Material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/features/dummy.dart';
 import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/widgets/empty_projects_widget.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/widgets/project_card.dart';
import 'package:mkaweel/features/screens/settings/data/base_type_worker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjectsListWidget extends StatelessWidget {
  const ProjectsListWidget({super.key, required this.state, required this.projectsCubit,required this.baseTypeAdmin});
  final BaseEmit? state;
  final ProjectsCubit projectsCubit;
  final BaseUserType baseTypeAdmin;

  @override
  Widget build(BuildContext context) {
    bool isLoading = state is! Success<AllProjectsRes>;

    final List<ProjectInfoData> list=isLoading?List.generate(5, (index) =>getEmptyProjectInfoData):(state as Success<AllProjectsRes>).data?.data??[] ;
    if(list.isNotEmpty){
      return SingleChildScrollView(
        padding: const .symmetric(vertical: 8),
        child: Column(
          children: list.map((e) => Skeletonizer(
            enabled:  isLoading,
            child: ProjectCard(
              baseTypeAdmin: baseTypeAdmin,
              margin: const .symmetric(horizontal: 12,vertical: 6),
              projectsCubit:projectsCubit ,
              projectInfoData:e
            ),
          )).toList()
        ),
      );

    }
    return const EmptyProjectsWidget();
  }
}
