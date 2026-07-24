part of 'add_edit_tasks_screen.dart';

abstract class AddEditTasksBaseState extends State<AddEditTasksPage> {
  // Cubit
  late final TasksCubit tasksCubit;
  late final WorkersCubit workersCubit;
  late final ProjectsCubit projectsCubit;

  // Controllers
  final TextEditingController _nameController = .new();
  final TextEditingController _dueDateController = .new();
  final TextEditingController _descriptionController = .new();

  // Notifiers for selectors
  final ValueNotifier<List<int>> selectedProjectNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys>> projectsList = .new([]);

  final ValueNotifier<List<int>> selectedPhaseNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys>> phaseList = .new([]);

  final ValueNotifier<List<int>> selectedWorkerNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys>> workersList = .new([]);

  final ValueNotifier<List<int>> statusNotifier = ValueNotifier([]);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // Focus and Field Keys
  late final List<(GlobalKey<FormFieldState>, FocusNode?)> listFields =
      List.generate(7, (index) => (GlobalKey<FormFieldState>(), FocusNode()));

  @override
  void initState() {
    tasksCubit = widget.args.tasksCubit;
    workersCubit = WorkersCubit.get(context: context);
    projectsCubit = ProjectsCubit.get(context: context);
    super.initState();
    _nameController.text = widget.args.taskItem?.name ?? '';
    _dueDateController.text = widget.args.taskItem?.due_date ?? '';
    _descriptionController.text = widget.args.taskItem?.description ?? '';

    Future.delayed(Duration(milliseconds: 200), () {
      workersCubit.getWorkersFunc().then((value) {
        if (value != null) {
          workersList.value = value.data
              .map((e) => UIApiKeys(e.name, e.id.toString()))
              .toList();
        }
      });

      projectsCubit.getAllProjectsFunc(Init()).then((value) {
        if(value!=null){
          projectsList.value = value.data
              .map((e) => UIApiKeys(e.name, e.id.toString()))
              .toList();

        }
      },);

    });

    // projectsList.value=;
    // phaseList.value=;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dueDateController.dispose();
    _descriptionController.dispose();
    selectedProjectNotifier.dispose();
    projectsList.dispose();
    selectedPhaseNotifier.dispose();
    phaseList.dispose();
    selectedWorkerNotifier.dispose();
    workersList.dispose();
    statusNotifier.dispose();

    for (var element in listFields) {
      element.$2?.dispose();
    }

    super.dispose();
  }

  void saveTask(bool isLoading) {
    if (isLoading) return;
    if (_key.currentState!.validate()) {
      // TODO: Call API via Cubit
    } else {
      // context.scrollToFirstError(listFields);
    }
  }

  final List<UIApiKeys> statusChoices = [
    UIApiKeys('Pending', 'pending'),
    UIApiKeys('In Progress', 'in_progress'),
    UIApiKeys('Completed', 'completed'),
  ];
}

// Placeholder data for dropdowns
// final List<UIApiKeys> projectChoices = [
//   UIApiKeys('Project A', '1'),
//   UIApiKeys('Project B', '2'),
// ];

// final List<UIApiKeys> phaseChoices = [
//   UIApiKeys('Phase 1', '1'),
//   UIApiKeys('Phase 2', '2'),
// ];

// final List<UIApiKeys> workerChoices = [
//   UIApiKeys('Worker A', '1'),
//   UIApiKeys('Worker B', '2'),
// ];
