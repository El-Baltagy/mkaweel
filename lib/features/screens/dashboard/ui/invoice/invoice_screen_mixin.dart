part of 'invoice_screen.dart';

abstract class InvoicePageBaseState extends State<InvoicePage> {
  late final DashboardCubit dashboardCubit;
  late final MarketPricesCubit marketPricesCubit;
  late final ProjectsCubit projectsCubit;

  final List<(GlobalKey<FormFieldState<dynamic>>, FocusNode?)> fields =
      List.generate(5, (index) => (GlobalKey<FormFieldState<dynamic>>(), null));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final ValueNotifier<List<int>> selectedProjectNotifier = ValueNotifier([]);
  final ValueNotifier<List<int>> selectedCategoryNotifier = ValueNotifier([]);
  final ValueNotifier<List<int>> selectedCurrencyNotifier = ValueNotifier([]);
  final ValueNotifier<String> attachmentNotifier = ValueNotifier('');

  final List<UIApiKeys> currenciesList = CurrencyTabsWidget.listTabs
      .map((e) => UIApiKeys(e.label, e.shortcut))
      .toList();

  // Example data (Will be populated by API in future)
  ValueNotifier<List<UIApiKeys>> projectsList = .new([]);
  ValueNotifier<List<UIApiKeys>> categoriesList = .new([]);

  @override
  void initState() {
    dashboardCubit = DashboardCubit.get(context: context);
    marketPricesCubit = MarketPricesCubit.get(context: context);
    projectsCubit = ProjectsCubit.get(context: context);
    // Set default date to today
    final now = DateTime.now();
    dateController.text =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    super.initState();

    setDataIntoControllers();

  }

  @override
  void dispose() {
    amountController.dispose();
    dateController.dispose();
    notesController.dispose();
    categoriesList.dispose();
    projectsList.dispose();
    super.dispose();
  }
  setDataIntoControllers()async{
    await Future.delayed(const Duration(milliseconds: 300),() {
      marketPricesCubit.getCatogeriesFunc(Init()).then((value) {
        if (value != null) {
          categoriesList.value = value.data
              .map((e) => UIApiKeys(e.name, e.id.toString()))
              .toList();
        }});

      projectsCubit.getAllProjectsFunc(Init()).then((value) {
        if (value != null) {
          projectsList.value = value.data
              .map((e) => UIApiKeys(e.name, e.id.toString()))
              .toList();
        }});
    },) ;

 final   invoiceItem=widget.args.invoiceItem;

 if(invoiceItem !=null){
   amountController.text=invoiceItem.$1.amount.toString();
   dateController.text=invoiceItem.$1.invoice_date;
   notesController.text=invoiceItem.$1.notes??"";
   selectedProjectNotifier.value=[projectsList.value.indexWhere((element) => element.apiValue==invoiceItem.$1.project_id.toString())];
   selectedCategoryNotifier.value=[categoriesList.value.indexWhere((element) => element.apiValue==invoiceItem.$1.category_id.toString())];
   selectedCurrencyNotifier.value=[currenciesList.indexWhere((element) => element.apiValue==invoiceItem.$2.currency.toLowerCase())];
   attachmentNotifier.value=invoiceItem.$1.attachment??'';

 }

  }



  void dashboardListener(BuildContext context, DashboardState state) {
    if(state is DashboardLoaded   ){
      if(state.createInvoiceState is Success<InvoiceRes>){
        final InvoiceRes data=(state.createInvoiceState as Success<InvoiceRes>).data!;
        if(data.status=='success' ){
          context.showToast(data.message).whenComplete(() => context.pop());
         }
      } else if(state.createInvoiceState is ErrorState){
        final ErrorState f=state.createInvoiceState as ErrorState  ;
        context.showToast(f.failure.message,
            isSuccess: false
        );
      }
    }
  }

  submitInvoice() async {
    if (await formKey.validateAndScroll(context, listRecorder: fields)) {
      if (selectedProjectNotifier.value.isEmpty ||
          selectedCategoryNotifier.value.isEmpty ||
          selectedCurrencyNotifier.value.isEmpty) {
        // Validation for dropdowns
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('please_fill_required_fields'.tr())),
        );
        return;
      }

      await dashboardCubit.createInvoiceFunc(
        parameter: CreateInvoiceParameter(
          amount: amountController.text,
          invoiceDate: dateController.text,
          category: categoriesList.value[selectedCategoryNotifier.value.first].apiValue,
          notes: notesController.text,
          currency: currenciesList[selectedCurrencyNotifier.value.first].apiValue,
          attachment: attachmentNotifier.value.isNotEmpty ? attachmentNotifier.value : null,
          projectId: projectsList.value[selectedProjectNotifier.value.first].apiValue,
        ),
      );
    }
  }
}
