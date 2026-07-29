part of '../tasks_screen.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    super.key,
      this.isScrolled=true,
      this.loadingItemNumbers=4,
    required this.state,
      this.margin,
    required this.tasksCubit,
    required this.parameter,
    this.filter = TaskFilter.all,
  });

  final BaseEmit? state;
  final TasksCubit tasksCubit;
  final BaseTasksData parameter;
  final bool isScrolled  ;
  final EdgeInsetsGeometry? margin  ;
  final int loadingItemNumbers  ;
  final TaskFilter filter;

  @override
  Widget build(BuildContext context) {
    bool isLoading = state is! Success<TasksRes>;

    if (!isLoading) {
      final allList = (state as Success<TasksRes>).data?.data ?? [];
      final filtered = _applyFilter(allList);
      if (filtered.isEmpty) {
        return _EmptyTasksWidget();
      }
    }

    final List<TaskItem> rawList = isLoading
        ? List.generate(loadingItemNumbers, (index) => getEmptyTask)
        : (state as Success<TasksRes>).data!.data;

    final List<TaskItem> listTasks = isLoading ? rawList : _applyFilter(rawList);

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

  List<TaskItem> _applyFilter(List<TaskItem> list) {
    switch (filter) {
      case TaskFilter.completed:
        return list.where((t) => t.status.toLowerCase() == 'completed').toList();
      case TaskFilter.uncompleted:
        return list.where((t) => t.status.toLowerCase() != 'completed').toList();
      case TaskFilter.all:
        return list;
    }
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