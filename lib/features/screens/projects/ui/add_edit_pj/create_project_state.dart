part  of 'create_project_screen.dart';
abstract class CreateProjectPageBaseState extends State<CreateProjectPage> {
  late final ProjectsCubit projectsCubit;

  final _key = GlobalKey<FormState>();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (.new(), .new());
   (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field4 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field3 = (.new(), .new());
   (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field5 = (.new(), .new());
  late  final List<UIApiKeys<String>> _listStringCurrencies = CurrencyTabsWidget.listTabs
      .map((e) => UIApiKeys(e.label, e.shortcut))
      .toList();
  final TextEditingController _controllerName = .new();
  final TextEditingController _controllerOwner_name = .new();
  final TextEditingController _controllerContract_value = .new();
  final TextEditingController _controllerStart_date = .new();
  final TextEditingController _controllerEnd_date = .new();
  final TextEditingController _controllerDescription = .new();
  final TextEditingController _controllerExtra_details = .new();
  final ValueNotifier<(String?, LatLng?)> locationNotifier = .new((null, null));
  final ValueNotifier<List<int>> selectedCurrencyNotifier = .new([]);
  late final ValueNotifier<bool> isLoadingNotifier  ;

  @override
  void initState() {
    isLoadingNotifier = .new(widget.args.projectId!=null );
    super.initState();
     projectsCubit = ProjectsCubit.get(context: context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      if(widget.args.projectId==null)return ;
     await projectsCubit.getProjectDataFunc(parameter:.new(widget.args.projectId!)).then((value) async {
        if(value!=null){
            _controllerName.text=value.data.name;
            _controllerOwner_name.text=value.data.owner_name;
            _controllerContract_value.text=value.data.contract_value??'';
            _controllerStart_date.text=value.data.start_date;
            _controllerEnd_date.text=value.data.end_date;
            _controllerDescription.text=value.data.description??'';
            _controllerExtra_details.text=value.data.extra_details??'';
            if(value.data.currency!=null) {
              Future.delayed(const Duration(milliseconds: 600),(){
              selectedCurrencyNotifier.value=[_listStringCurrencies.indexWhere((e) => e.apiValue.toLowerCase()==value.data.currency?.toLowerCase())] ;
            });
            }
            if(value.data.latitude!=null&&value.data.longitude!=null){
              locationNotifier.value =  (null, LatLng(double.parse(value.data.latitude!), double.parse(value.data.longitude!))) ;

            }

        }
       var addressModel= await LocationService().reverseGeocode(locationNotifier.value.$2 );
        if(addressModel!=null){
          Future.delayed(const Duration(milliseconds: 600),(){
            locationNotifier.value=( addressModel.toString(),locationNotifier.value.$2)  ;
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
     field4.$2?.dispose();
    field3.$2?.dispose();
    field5.$2?.dispose();

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
      await projectsCubit.createProjectFunc(
        parameter: CreateProjectParameters(
          projectId:null,
          // projectId: widget.args.projectId,
          name: _controllerName.text,
          owner_name: _controllerOwner_name.text,
          contract_value: _controllerContract_value.text,
          start_date: _controllerStart_date.text,
          end_date: _controllerEnd_date.text,
          description: _controllerDescription.text,
          extra_details: _controllerExtra_details.text,
          currency:
          _listStringCurrencies[selectedCurrencyNotifier.value.first].apiValue.toUpperCase(),
           latitude: locationNotifier.value.$2?.lat.toString()??'',
          longitude: locationNotifier.value.$2?.lng.toString()??'',
          location: locationNotifier.value.$1??'',

        ),
      );
    }
  }
   void createProjectLisener(BuildContext context,ProjectsState state) {
    if (state is ProjectsLoaded) {
      if(state.createProjectResState  is Success<(CreateProjectRes,bool)>) {
        PrintHelper().ordinaryPrint('...................wasd');
        final (CreateProjectRes,bool) data=(state.createProjectResState as Success<(CreateProjectRes,bool)>).data! ;
        PrintHelper().ordinaryPrint('...................1444444444444');
        context.showToast(
            data.$1.message
        );

        context.pop(data.$2);
        // context.pop(data.$2);
      }else{
        if(state.createProjectResState  is ErrorState ) {
          final ErrorState  data= state.createProjectResState  as ErrorState;
          context.showToast(
              data.failure.message,
              isSuccess: false
          );
        }
      }
    }
  }



}