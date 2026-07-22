part of '../tasks_screen.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    super.key,
    required this.state,
    required this.tasksCubit, required this.parameter,
  });

  final BaseEmit? state;
  final TasksCubit tasksCubit;
  final BaseTasksData parameter;

  @override
  Widget build(BuildContext context) {
    bool isLoading = state is! Success<TasksRes>;

    if (!isLoading) {
      final list = (state as Success<TasksRes>).data?.data ?? [];
      if (list.isEmpty) {
        return _EmptyTasksWidget();
      }
    }

    final List<TaskItem> listTasks = isLoading
        ? List.generate(4, (index) => TaskItem.getEmptyItem)
        : (state as Success<TasksRes>).data!.data;

    return EntranceFader(
      dx: context.isLTR ? -32 : 32,
      enableAnimation: !isLoading,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        itemCount: listTasks.length,
        itemBuilder: (context, index) {
          return Skeletonizer(
            enabled: isLoading,
            child: _TaskListItem(
              taskItem: listTasks[index],
              tasksCubit: tasksCubit,
              parameter: parameter,
            ),
          );
        },
      ),
    );
  }
}