part of '../tasks_screen.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    super.key,
      this.isScrolled=true,
      this.loadingItemNumbers=4,
    required this.state,
      this.margin,
    required this.tasksCubit, required this.parameter,
  });

  final BaseEmit? state;
  final TasksCubit tasksCubit;
  final BaseTasksData parameter;
  final bool isScrolled  ;
  final EdgeInsetsGeometry? margin  ;
  final int loadingItemNumbers  ;

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
        ? List.generate(loadingItemNumbers, (index) => getEmptyTask)
        : (state as Success<TasksRes>).data!.data;

    return EntranceFader(
      dx: context.isLTR ? -32 : 32,
      enableAnimation: !isLoading,
      child: isScrolled?ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        itemCount: listTasks.length,
        itemBuilder: (context, index) {
          return buildSkeletonizer(isLoading, listTasks, index);
        },
      ):Column(
        children: List.generate(listTasks.length,(index) =>   buildSkeletonizer(isLoading, listTasks, index))
      ),
    );
  }

  Skeletonizer buildSkeletonizer(bool isLoading, List<TaskItem> listTasks, int index) {
    return Skeletonizer(
          enabled: isLoading,
          child: _TaskListItem(
            margin: margin,
            taskItem: listTasks[index],
            tasksCubit: tasksCubit,
            parameter: parameter,
          ),
        );
  }
}