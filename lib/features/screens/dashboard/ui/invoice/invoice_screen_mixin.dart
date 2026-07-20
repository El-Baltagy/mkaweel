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
       marketPricesCubit.getCatogeriesFunc(Init()).then((value) {
        if (value != null) {
          categoriesList.value = value.data
              .map((e) => UIApiKeys(e.name, e.id.toString()))
              .toList();
        }
      });

      projectsCubit.getAllProjectsFunc(Init()).then((value) {
        if (value != null) {
          projectsList.value = value.data
              .map((e) => UIApiKeys(e.name, e.id.toString()))
              .toList();
        }
       });


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

  submitInvoice() async {
    if (await formKey.validateAndScroll(context, listRecorder: fields)) {
      //    if (selectedProjectNotifier.value.isEmpty ||
      //       selectedCategoryNotifier.value.isEmpty ||
      //       selectedCurrencyNotifier.value.isEmpty) {
      //     // Validation for dropdowns
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('please_fill_required_fields'.tr())),
      //     );
      //     return;
      //   }
      //   // TODO: Proceed to submit API
    }
  }
}
