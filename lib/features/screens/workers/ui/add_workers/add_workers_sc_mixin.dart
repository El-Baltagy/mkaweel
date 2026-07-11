part of 'add_worker_screen.dart';

abstract class AddWorkerPageBaseState extends State<AddWorkerPage> {
  List<UIApiKeys> pjChoices = [];
  late final WorkersCubit workersCubit;
  late final ProjectsCubit projectsCubit;
  final _key = GlobalKey<FormState>();
  List<(GlobalKey<FormFieldState<dynamic>>, FocusNode?)> listFields =
      List.generate(5, (index) => (.new(), .new()));


  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _pwConfirmController = TextEditingController();

  final ValueNotifier<List<int>> _roleIndexesNotifier = .new([]);

  final _specController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

   final ValueNotifier<String >  avatarNotifier = .new("");
  @override
  void initState() {
    workersCubit = WorkersCubit.get(context: context);
    projectsCubit = ProjectsCubit.get(context: context);
    super.initState();
    _nameController.text=widget.args.workerItem?.name??"";
    _emailController.text=widget.args.workerItem?.email??"";
    _specController.text=widget.args.workerItem?.specialization??"";
    _phoneController.text=widget.args.workerItem?.phone??"";
    _dobController.text=widget.args.workerItem?.dob??"";
    avatarNotifier.value=widget.args.workerItem?.avatar??"";
    Future.delayed(const Duration(milliseconds: 500), () {
      final idx = listChoices.indexWhere(
        (element) => element.apiValue == widget.args.workerItem?.role,
      );
      if (idx != -1) _roleIndexesNotifier.value = [idx];
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (var element in listFields) {
      element.$2?.dispose();
    }
    _nameController.dispose();
    _emailController.dispose();
    _pwController.dispose();
    _pwConfirmController.dispose();

    _roleIndexesNotifier.dispose();

    _specController.dispose();
    _phoneController.dispose();
    _dobController.dispose();

    avatarNotifier.dispose();

    super.dispose();
  }

  Future<void> addUpdateWorker(bool isLoading) async {
    if (isLoading) return;
    if (await _key.validateAndScroll(context, listRecorder:listFields)) {
      final AddWorkerDataRequest addWorkerDataRequest=AddWorkerDataRequest(
        workerId: widget.args.workerItem?.id.toString(),
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _pwController.text.trim(),
        dob: _dobController.text.trim(),
        phone: _phoneController.text.trim(),
        specialization: _specController.text.trim(),
        role: listChoices[_roleIndexesNotifier.value.first].apiValue,
        avatarPath: ['https',null,''].contains(avatarNotifier.value ) ?null:avatarNotifier.value
      ) ;
      PrintHelper().ordinaryPrint(await addWorkerDataRequest.toJson() );
      // return ;
      await workersCubit.addUpdateWorkerFunc(
        parameter: addWorkerDataRequest
      );
    }
  }
  void   listenerWorkersCubit(BuildContext c, WorkersState s){
    if(s is AllWorkersLoaded ){
      if(s.addUpdateWorkerState is Success<DeleteProjectRes?>){
        final x=s.addUpdateWorkerState as Success<DeleteProjectRes?>;
        if( x.data?.status=="success"){
             context.pop(true);
         }
        context.showToast( x.data?.message );
      }
      if(s.addUpdateWorkerState is ErrorState){
        context.showToast( (s.addUpdateWorkerState as ErrorState ) .failure.message,isSuccess: false);
      }
    }
  }
  List<UIApiKeys> listChoices = [
    .new('worker'.tr(), 'Worker'),
    .new('supervisor'.tr(), 'Supervisor'),
    .new('site_manager'.tr() + ' / ' + 'admin'.tr(), 'Site Manager / Admin'),
  ];
}
