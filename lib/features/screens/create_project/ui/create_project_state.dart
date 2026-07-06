part  of 'create_project_screen.dart';
abstract class CreateProjectPageBaseState extends State<CreateProjectPage> {
  late final CreateProjectCubit createProjectCubit;

  final _key = GlobalKey<FormState>();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field3 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field4 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field5 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field6 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field7 = (.new(), .new());
  final TextEditingController _controllerName = .new();
  final TextEditingController _controllerOwner_name = .new();
  final TextEditingController _controllerContract_value = .new();
  final TextEditingController _controllerStart_date = .new();
  final TextEditingController _controllerEnd_date = .new();
  final TextEditingController _controllerDescription = .new();
  final TextEditingController _controllerExtra_details = .new();
  final ValueNotifier<(String?, LatLng?)> locationNotifier = .new((null, null));
  final ValueNotifier<String> selectedCurrencyNotifier = .new('');

  @override
  void initState() {
    super.initState();
    createProjectCubit = CreateProjectCubit.get(context: context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    field1.$2?.dispose();
    field2.$2?.dispose();
    field3.$2?.dispose();
    field4.$2?.dispose();
    field5.$2?.dispose();
    field6.$2?.dispose();
    field7.$2?.dispose();

    _controllerName.dispose();
    _controllerOwner_name.dispose();
    _controllerContract_value.dispose();
    _controllerStart_date.dispose();
    _controllerEnd_date.dispose();
    _controllerDescription.dispose();
    _controllerExtra_details.dispose();

    selectedCurrencyNotifier.dispose();
    locationNotifier.dispose();

    super.dispose();
  }

  createProject(bool isLoading) async {
    if (isLoading) return;
    if (await _key.validateAndScroll(
      context,
      listRecorder: [field1, field2],
    )) {
      // debugPrint(CreateProjectParameters(
      //   name: _controllerName.text,
      //   owner_name: _controllerOwner_name.text,
      //   contract_value: _controllerContract_value.text,
      //   start_date: _controllerStart_date.text,
      //   end_date: _controllerEnd_date.text,
      //   description: _controllerDescription.text,
      //   extra_details: _controllerExtra_details.text,
      //   currency: selectedCurrencyNotifier.value,
      //   latitude: locationNotifier.value.$2!.lat.toString(),
      //   longitude: locationNotifier.value.$2!.lng.toString(),
      // ).toJsonBody().toString());
      // return;
      await createProjectCubit.createProjectFunc(
        parameter: CreateProjectParameters(
          name: _controllerName.text,
          owner_name: _controllerOwner_name.text,
          contract_value: _controllerContract_value.text,
          start_date: _controllerStart_date.text,
          end_date: _controllerEnd_date.text,
          description: _controllerDescription.text,
          extra_details: _controllerExtra_details.text,
          currency: selectedCurrencyNotifier.value,
          latitude: locationNotifier.value.$2!.lat.toString(),
          longitude: locationNotifier.value.$2!.lng.toString(),
        ),
      );
    }
  }

  void createProjectLisener(BuildContext context,CreateProjectState state) {
    if (state is CreateProjectResState) {
      if(state.baseEmit  is Success<CreateProjectRes>) {
        final CreateProjectRes data=(state.baseEmit as Success<CreateProjectRes>).data!;
        context.showToast(
            data.message
        );
        context.pop();
      }else{
        if(state.baseEmit  is ErrorState ) {
          final ErrorState  data= state.baseEmit  as ErrorState;
          context.showToast(
              data.failure.message,
              isSuccess: false
          );
        }
      }
    }
  }

  final List<String> _listStringCurrencies = [
    'SAR',
    'USD',
    'TRY',
    'EUR',
    'AED',
    'EGP',
    'IQD',
    'JOD',
    'KWD',
    'LYD',
    'OMR',
    'QAR',
    'SYP',
  ];
}