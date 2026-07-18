part of 'add_edit_tasks_screen.dart';

abstract class AddEditTasksBaseState extends State<AddEditTasksPage> {
  // Cubit
  late final TasksCubit cubit;

  // Controllers
  late final TextEditingController _nameController;
  late final TextEditingController _dueDateController;
  late final TextEditingController _descriptionController;

  // Notifiers for selectors
  final ValueNotifier<List<int>> projectNotifier = ValueNotifier([]);
  final ValueNotifier<List<int>> phaseNotifier = ValueNotifier([]);
  final ValueNotifier<List<int>> workerNotifier = ValueNotifier([]);
  final ValueNotifier<List<int>> statusNotifier = ValueNotifier([]);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // Focus and Field Keys
  late final List<(GlobalKey<FormFieldState>, FocusNode?)> listFields;

  @override
  void initState() {
    super.initState();
    cubit = context.read<TasksCubit>();
    _nameController = TextEditingController();
    _dueDateController = TextEditingController();
    _descriptionController = TextEditingController();

    listFields = List.generate(
      7,
          (index) => (GlobalKey<FormFieldState>(), FocusNode()),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dueDateController.dispose();
    _descriptionController.dispose();
    projectNotifier.dispose();
    phaseNotifier.dispose();
    workerNotifier.dispose();
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

  // Placeholder data for dropdowns
  final List<UIApiKeys> projectChoices = [
    UIApiKeys('Project A', '1'),
    UIApiKeys('Project B', '2'),
  ];

  final List<UIApiKeys> phaseChoices = [
    UIApiKeys('Phase 1', '1'),
    UIApiKeys('Phase 2', '2'),
  ];

  final List<UIApiKeys> workerChoices = [
    UIApiKeys('Worker A', '1'),
    UIApiKeys('Worker B', '2'),
  ];

  final List<UIApiKeys> statusChoices = [
    UIApiKeys('Pending', 'pending'),
    UIApiKeys('In Progress', 'in_progress'),
    UIApiKeys('Completed', 'completed'),
  ];
}
