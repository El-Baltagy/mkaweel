part of 'project_invoices_screen.dart';

abstract class ProjectInvoicesPageBaseState extends State<ProjectInvoicesPage> {
  late final ProjectsCubit projectsCubit;

  @override
  void initState() {
    super.initState();
    projectsCubit = widget.args.projectsCubit;
    _fetchInvoices();
  }

  void _fetchInvoices() {
    // We use a hardcoded id '1' for now.
    // If you add a projectId to ProjectInvoicesRouteArgs, you can pass it here.
    projectsCubit.getProjectInvoicesFunc(
      parameter: DeleteProjectParameter(widget.args.projectID),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
