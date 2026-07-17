part of 'add_edit_tasks_screen.dart';

abstract class AddEditTasksBaseState extends State<AddEditTasksPage> {
  // Cubit
  late final TasksCubit cubit;

  // Controllers
  late final TextEditingController nameController;
  late final TextEditingController projectController;
  late final TextEditingController phaseController;
  late final TextEditingController workerController;
  late final TextEditingController dueDateController;
  late final TextEditingController statusController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    cubit = context.read<TasksCubit>();
    nameController = TextEditingController();
    projectController = TextEditingController();
    phaseController = TextEditingController();
    workerController = TextEditingController();
    dueDateController = TextEditingController();
    statusController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    projectController.dispose();
    phaseController.dispose();
    workerController.dispose();
    dueDateController.dispose();
    statusController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
