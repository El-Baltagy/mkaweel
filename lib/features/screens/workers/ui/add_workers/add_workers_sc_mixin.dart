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

  final ValueNotifier<List<int>> _projectIdsNotifier = .new([]);
  final ValueNotifier<(File?, String?)> _image = .new((null,null));

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
    // _roleIndexesNotifier.value=;
    projectsCubit.getAllProjectsFunc().then((va) {
      _projectIdsNotifier.value=
          (widget.args.workerItem?.projects??[])
              .map((ee) => va!.data.map((e) => e.id).toList().indexOf(ee.id)).toList();
    },);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    listFields.forEach((element) {
      element.$2?.dispose();
    });
    _nameController.dispose();
    _emailController.dispose();
    _pwController.dispose();
    _pwConfirmController.dispose();

    _roleIndexesNotifier.dispose();

    _specController.dispose();
    _phoneController.dispose();
    _dobController.dispose();

    _projectIdsNotifier.dispose();
    _image.dispose();

    super.dispose();
  }

  Future<void> addUpdateWorker(bool isLoading) async {
    if (isLoading) return;
    if (await _key.validateAndScroll(context, listRecorder:listFields)) {
      AddWorkerDataRequest addWorkerDataRequest=AddWorkerDataRequest(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _pwController.text.trim(),
        dob: _dobController.text.trim(),
        phone: _phoneController.text.trim(),
        specialization: _specController.text.trim(),
        role: listChoices[_roleIndexesNotifier.value.first].apiValue,
        avatarPath: _image.value.$1?.path,
        projectIds: _projectIdsNotifier.value
            .map((e) => int.parse(pjChoices[e].apiValue))
            .toList(),
      ) ;
      // PrintHelper().ordinaryPrint(await addWorkerDataRequest.toJson() );
      // return ;
      await workersCubit.addWorkerFunc(
        parameter: addWorkerDataRequest
      );
    }
  }
  void   listenerWorkersCubit(BuildContext c, WorkersState s){
    if(s is AllWorkersLoaded ){
      if(s.addWorkerState is Success<DeleteProjectRes?>){
        final x=s.addWorkerState as Success<DeleteProjectRes?>;
        if( x.data?.status=="success"){
          // context.pop(true);
        }
        context.showToast( x.data?.message );
      }
      if(s.addWorkerState is ErrorState){
        context.showToast( (s.addWorkerState as ErrorState ) .failure.message,isSuccess: false);
      }
    }
  }
  List<UIApiKeys> listChoices = [
    .new('worker'.tr(), 'Worker'),
    .new('supervisor'.tr(), 'Supervisor'),
    .new('site_manager'.tr() + ' / ' + 'admin'.tr(), 'Site Manager / Admin'),
  ];
}
