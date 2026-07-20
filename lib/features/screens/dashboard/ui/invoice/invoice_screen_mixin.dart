part of 'invoice_screen.dart';

abstract class InvoicePageBaseState extends State<InvoicePage> {
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
