part of 'gant_chart_screen.dart';


abstract class GanttChartPageBaseState extends State<GanttChartPage> {
  late final DashboardCubit dashboardCubit;
  late final ProjectsCubit projectsCubit;

  @override
  void initState() {
    dashboardCubit = widget.args.dashboardCubit;
    projectsCubit = ProjectsCubit.get(context: context);
    dashboardCubit.init();
    super.initState();

    projectsCubit.getAllProjectsFunc(Init());
  }


  @override
  void dispose() {
    super.dispose();
  }
}
