part of 'add_worker_screen.dart';
abstract class AddWorkerPageBaseState extends State<AddWorkerPage> {
  List<UIApiKeys>pjChoices=[];
  late final WorkersCubit workersCubit;
  final _key = GlobalKey<FormState>();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field3 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field4 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field5 = (.new(), .new());


  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _pwConfirmController = TextEditingController();

  final ValueNotifier<List<int>>_roleIndexesNotifier = .new([]);

  final _specController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  final ValueNotifier<List<int>>_projectIdsNotifier = .new([]);
  final ValueNotifier<File?>_image = .new(null);


  @override
  void initState() {
    workersCubit = WorkersCubit.get(context: context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    field1.$2?.dispose();
    field2.$2?.dispose();
    field3.$2?.dispose();
    field4.$2?.dispose();
    field5.$2?.dispose();

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
    if (await _key.validateAndScroll(context, listRecorder: [field1, field2])) {
      await workersCubit.addWorkerFunc(
        parameter: AddWorkerDataRequest(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _pwController.text.trim(),
          dob: _dobController.text.trim(),
          phone: _phoneController.text.trim(),
          specialization: _specController.text.trim(),
          role: listChoices[_roleIndexesNotifier.value.first].apiValue  ,
          avatarPath: _image.value?.path,
          projectIds: _projectIdsNotifier.value.map((e) =>int.parse(pjChoices[e].apiValue)).toList(),
        ),
      );
    }
  }

  List<UIApiKeys> listChoices = [
        .new('worker'.tr(), 'Worker'),
        .new('supervisor'.tr(), 'Supervisor'),
        .new(
        'site_manager'.tr() + ' / ' + 'admin'.tr(), 'Site Manager / Admin'),
  ];
}