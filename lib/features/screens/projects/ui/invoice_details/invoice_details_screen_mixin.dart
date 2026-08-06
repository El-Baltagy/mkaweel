part of 'invoice_details_screen.dart';

abstract class InvoiceDetailsPageBaseState extends State<InvoiceDetailsPage> {
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
