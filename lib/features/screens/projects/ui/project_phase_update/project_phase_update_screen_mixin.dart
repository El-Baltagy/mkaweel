part of 'project_phase_update_screen.dart';

abstract class ProjectPhaseUpdatePageBaseState
    extends State<ProjectPhaseUpdatePage> {
  late final ProjectsCubit projectsCubit;

  @override
  void initState() {
    projectsCubit = ProjectsCubit.get(context: context);
    super.initState();
    _fetchHistory();
  }

  void _fetchHistory() {
    projectsCubit.getPhaseUpdatesFunc(
      parameter: GetProjectDataParameter(
        widget.args.phaseId.toString(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
