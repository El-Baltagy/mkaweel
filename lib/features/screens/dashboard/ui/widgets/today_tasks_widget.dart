import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/tasks_screen.dart';

class TodayTasksWidget extends StatelessWidget {
  const TodayTasksWidget({super.key, required this.tasksCubit});
final TasksCubit tasksCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text('tasks'.tr(), style: AppTextStyles.font16SemiBold),
              GestureDetector(
                 onTap: () => context.push(TasksRoute(args: const TasksRouteArgs(
                     AdminTasksData(.all )
                 ))),
                 child: Text(
                  'show_all'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          10.verticalSpace,

          BlocSelector<TasksCubit, TasksState, BaseEmit?>(
            selector: (state) => state is TasksLoaded ? state.todayTasksState : null,
            builder: (context, state) {
              bool isLoading = state is! Success<TasksRes>;
              bool isEmpty = !isLoading && ( state .data?.data.isEmpty ?? true);

              if (isEmpty) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p40),
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(AppSizes.s12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_box_outlined,
                        size: AppSizes.s48,
                        color: AppColors.contractorGreyText.withOpacity(0.5),
                      ),
                      10.verticalSpace,
                      Text(
                        'no_tasks_scheduled'.tr(),
                        style: AppTextStyles.font14Regular,
                      ),
                    ],
                  ),
                );
              }

              return TasksListWidget(
                parameter: const AdminTasksData(AdminTaskType.today),
                state: state,
                margin:  .only(bottom: 15),
                isScrolled: false,
                loadingItemNumbers:1,
                tasksCubit: tasksCubit,
              );
            },
          ),
        ],
      ),
    );
  }
}
