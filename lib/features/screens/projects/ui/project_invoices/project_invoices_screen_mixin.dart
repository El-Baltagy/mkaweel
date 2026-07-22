part of 'project_invoices_screen.dart';

abstract class ProjectInvoicesPageBaseState extends State<ProjectInvoicesPage> {
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
