part of 'workers_widgets.dart';

class WorkerCardWidget extends StatelessWidget {
  const WorkerCardWidget({super.key, required this.worker, required this.workersCubit});
  final WorkerItem worker;
  final WorkersCubit workersCubit;
  @override
  Widget build(BuildContext context) {

    bool isActive=true;
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        border: Border.all(color: context.theme.canvasColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: context.theme.canvasColor,
            child: const Icon(Icons.person_outline, color: AppColors.contractorGreyText),
          ),
          const SizedBox(width: AppSizes.s12),
          Column(
            spacing: AppSizes.s8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(worker.name, style: AppTextStyles.font16SemiBold),
              if(worker.role!=null)
                Text(worker.role!, style: AppTextStyles.font14Regular.copyWith(color: Theme.of(context).primaryColor)),
              if(worker.phone!=null)
                GestureDetector(
                  onTap:  worker.phone!.redirectToPhoneCall ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.phone_outlined, size: 16, color: AppColors.contractorGreyText),
                      const SizedBox(width: AppSizes.s4),
                      Text(worker.phone!, style: AppTextStyles.font14Regular.copyWith(
                          decoration: .underline,
                          color: AppColors.blue
                      )),

                    ],
                  ),
                ),
              if(worker.dob!=null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${'date_of_birth'.tr()} : ${worker.dob}',
                      style: AppTextStyles.font12Regular,
                    ),
                  ],
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p4),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.contractorGreen.withOpacity(0.15)
                      : Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppSizes.s20),
                ),
                child: Text(
                  isActive ? 'active'.tr() : 'inactive'.tr(),
                  style: AppTextStyles.font12Regular.copyWith(
                    color: isActive? AppColors.contractorGreen : AppColors.contractorGreyText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          // Action icons
          Column(
            children: [
              InkWell(
                onTap: () async {
                  var result=await context.push(AddWorkerRoute(args:   AddWorkerRouteArgs(workerItem:  worker )));
                  if (result == true) {
                    await workersCubit.getWorkersFunc();
                  }
                },
                child: Icon(Icons.edit_outlined, color: Theme.of(context).primaryColor, size: 20),
              ),
              const SizedBox(height: AppSizes.s12),
              BlocBuilder<WorkersCubit, WorkersState>(
                bloc: workersCubit,
  builder: (context, state) {
    bool isDeleting = false;
    if (state is AllWorkersLoaded && state.deletingWorkersIds.contains(worker.id.toString())) {
      isDeleting = true;
    }

    return isDeleting
        ? const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    )
        :InkWell(
                onTap: DeletePjDialouge(
                  onPressedDelete: () => workersCubit.deleteWorkerFunc(parameter: .new(worker.id.toString()),
                )).toShowDialouge,
                 child:   Icon(Icons.delete_outline, color: context.theme.colorScheme.secondary, size: 20),
              );
  },
)

            ],
          ),
        ],
      ),
    );
  }
}