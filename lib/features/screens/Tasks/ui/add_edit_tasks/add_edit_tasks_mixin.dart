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
  final ValueNotifier<List<UIApiKeys<ProjectInfoData>>> projectsList = .new([]);

  final ValueNotifier<List<int>> selectedPhaseNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys<ProjectphaseItem>>> phaseList = .new([]);

  final ValueNotifier<List<int>> selectedWorkerNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys<String>>> workersList = .new([]);

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

    // Whenever the selected project changes, update phaseList with the
    // phases that belong to that project and reset the phase selection.
    selectedProjectNotifier.addListener(_onProjectChanged);

    // Future.delayed(Duration(milliseconds: 500), () {
      // ── Workers ──────────────────────────────────────────────────────────
      workersCubit.getWorkersFunc().then((value) {
        if (value != null) {
          workersList.value = value.data
              .map((e) => UIApiKeys(e.name, e.id.toString()))
              .toList();

          // Pre-select worker for edit mode.
          if (widget.args.taskItem != null) {
            final workerIndex = workersList.value.indexWhere(
              (element) => element.apiValue == widget.args.taskItem!.worker.id.toString(),
            );
            if (workerIndex != -1) {
              selectedWorkerNotifier.value = [workerIndex];
            }
          }
        }
      });

      // ── Projects & Phases ─────────────────────────────────────────────────
      projectsCubit.getAllProjectsFunc(Reload()).then((value) {
        PrintHelper().ordinaryPrint('.....2222222222222222222222..ascsccccccccccccccc $value');
        if (value != null) {
          PrintHelper().ordinaryPrint('............................ascsccccccccccccccc');
          projectsList.value = value.data
              .where((element) => element.project_phases?.isNotEmpty == true)
              .map((e) => UIApiKeys(e.name, e))
              .toList();
        }

        // Pre-select project & phase for edit mode.
        if (widget.args.taskItem != null) {
          final projectIndex = projectsList.value.indexWhere(
            (element) => element.apiValue.id == widget.args.taskItem!.project.id,
          );
          if (projectIndex != -1) {
            // Triggers _onProjectChanged → populates phaseList automatically.
            selectedProjectNotifier.value = [projectIndex];

            // One microtask later, phaseList is ready — pick the right phase.
            Future.microtask(() {
              final phaseIndex = phaseList.value.indexWhere(
                (element) => element.apiValue.id == widget.args.taskItem!.project_phase.id,
              );
              if (phaseIndex != -1) {
                selectedPhaseNotifier.value = [phaseIndex];
              }
            });
          }
        }
      });

      // ── Status ────────────────────────────────────────────────────────────
      if (widget.args.taskItem != null) {
        final statusIndex = statusChoices.indexWhere(
          (element) => element.apiValue == widget.args.taskItem!.status,
        );
        if (statusIndex != -1) {
          statusNotifier.value = [statusIndex];
        }
      }
    // });
  }

  /// Updates [phaseList] with the phases of the currently selected project
  /// and clears any previously selected phase.
  void _onProjectChanged() {
    final indices = selectedProjectNotifier.value;
    if (indices.isEmpty) {
      phaseList.value = [];
      selectedPhaseNotifier.value = [];
      return;
    }

    final selectedIndex = indices.first;
    if (selectedIndex < 0 || selectedIndex >= projectsList.value.length) {
      phaseList.value = [];
      selectedPhaseNotifier.value = [];
      return;
    }

    final selectedProject = projectsList.value[selectedIndex].apiValue;
    final phases = selectedProject.project_phases ?? [];

    phaseList.value = phases
        .map((phase) => UIApiKeys(phase.name, phase))
        .toList();

    // Reset phase selection when project changes.
    selectedPhaseNotifier.value = [];
  }

  @override
  void dispose() {
    selectedProjectNotifier.removeListener(_onProjectChanged);
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
