part of 'suppliers_info_screen.dart';

abstract class SuppliersInfoPageBaseState extends State<SuppliersInfoPage> {
  late final DashboardCubit dashboardCubit;

  @override
  void initState() {
    dashboardCubit = DashboardCubit.get(context: context);
    // TODO: implement initState
    super.initState();
    // dashboardCubit.getSuppliersFunc(Reload());
    dashboardCubit.getSuppliersFunc(Init());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
