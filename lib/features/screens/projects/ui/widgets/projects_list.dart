import 'package:flutter/Material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/features/screens/create_project/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/ui/widgets/empty_projects_widget.dart';
import 'package:mkaweel/features/screens/projects/ui/widgets/project_card.dart';

class ProjectsListWidget extends StatelessWidget {
  const ProjectsListWidget({super.key, required this.state});
  final BaseEmit? state;


  @override
  Widget build(BuildContext context) {
    bool isLoading=state is !Success<AllProjectsRes>;
    if(isLoading){
      return Center(
          child: CircularProgressIndicator());
    }

    List<ProjectInfoData> list=isLoading?[]:(state as Success<AllProjectsRes>).data?.data??[] ;
    if(list.isNotEmpty){
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => ProjectCard(
            projectInfoData:list[index],
          ));
    }
    return const EmptyProjectsWidget();
  }
}
