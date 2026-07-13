part of 'project_details_screen.dart';
abstract class ProjectDetailsPageBaseState extends State<ProjectDetailsPage> {
  late final ProjectsCubit projectsCubit;

  @override
  void initState() {
    projectsCubit = widget.args.projectsCubit;
    super.initState();
    projectsCubit.getProjectPhasesFunc(parameter: .new(  widget.args.projectInfoData.id.toString()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void listener(BuildContext context, ProjectsState state) {
    // TODO: implement listener
  }

}