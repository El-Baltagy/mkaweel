part of 'project_phase_update_screen.dart';

abstract class ProjectPhaseUpdatePageBaseState extends State<ProjectPhaseUpdatePage> {
  late final ProjectsCubit projectsCubit;

  @override
  void initState() {
    projectsCubit = ProjectsCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
