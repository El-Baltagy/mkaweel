part of 'suppliers_screen.dart';

abstract class SuppliersPageBaseState extends State<SuppliersPage> {
  late final DashboardCubit dashboardCubit;

  @override
  void initState() {
    dashboardCubit = DashboardCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
