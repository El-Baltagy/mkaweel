part of 'gant_chart_screen.dart';


abstract class GanttChartPageBaseState extends State<GanttChartPage> {
  late final DashboardCubit dashboardCubit;
  late final ProjectsCubit projectsCubit;

  @override
  void initState() {
    dashboardCubit = widget.args.dashboardCubit;
    projectsCubit = ProjectsCubit.get();
    // TODO: implement initState
    super.initState();

  }


  @override
  void dispose() {
    super.dispose();
  }
}
