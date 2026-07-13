import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/string.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/widgets/delete_pj_dialouge.dart';
 import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
import 'package:mkaweel/features/screens/workers/data/model/all_workers/all_workers.dart';
part   'empty_workers.dart';
part   'worker_card_item.dart';

class WorkersListWidget extends StatelessWidget {
  const WorkersListWidget({super.key, required  this.emit, required this.workersCubit, required this.projectsCubit});
  final BaseEmit? emit;
   final WorkersCubit workersCubit;
   final ProjectsCubit projectsCubit;
  @override
  Widget build(BuildContext context) {
    bool isLoading=emit is! Success<AllWorkers?>;
    if (isLoading) return const Center(child: CircularProgressIndicator());

    final workers = (emit as Success<AllWorkers?>).data?.data ?? [];
     if (workers.isEmpty) return const EmptyWorkersWidget();
    return ListView.separated(
      padding: const EdgeInsets.all(AppPadding.p16),
      itemCount: workers.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.s12),
      itemBuilder: (context, index) => WorkerCardWidget(worker: workers[index],workersCubit:workersCubit,
      projectsCubit:projectsCubit ,
      ),
    );
  }
}
