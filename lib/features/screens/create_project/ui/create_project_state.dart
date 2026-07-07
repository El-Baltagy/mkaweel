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
  late final ValueNotifier<bool> isLoadingNotifier  ;

  @override
  void initState() {
    isLoadingNotifier = .new(widget.args.projectId!=null );
    super.initState();
    createProjectCubit = CreateProjectCubit.get(context: context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      if(widget.args.projectId==null)return ;
     await createProjectCubit.getProjectDataFunc(parameter:.new(widget.args.projectId!)).then((value) async {
        if(value!=null){
            _controllerName.text=value.data.name;
            _controllerOwner_name.text=value.data.owner_name;
            _controllerContract_value.text=value.data?.contract_value??"";
            _controllerStart_date.text=value.data.start_date;
            _controllerEnd_date.text=value.data.end_date;
            _controllerDescription.text=value.data.description??"";
            _controllerExtra_details.text=value.data.extra_details??"";
            if(value.data.currency!=null) {
              Future.delayed(const Duration(milliseconds: 600),(){
              selectedCurrencyNotifier.value=value.data.currency! ;
            });
            }
            locationNotifier.value =  (null, LatLng(double.parse(value.data.latitude), double.parse(value.data.longitude))) ;

        }
       var addressModel= await LocationService().reverseGeocode(locationNotifier.value.$2 );
        if(addressModel!=null){
          Future.delayed(const Duration(milliseconds: 600),(){
            locationNotifier.value=( addressModel!.toString(),locationNotifier.value.$2)  ;
          });

        }

        isLoadingNotifier.value=false;
      },);


    },);

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
    isLoadingNotifier.dispose();
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
        context.pop(true);
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