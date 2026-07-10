import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/string.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/workers/data/model/all_workers/all_workers.dart';
part   'empty_workers.dart';


class WorkersListWidget extends StatelessWidget {
  const WorkersListWidget({super.key, required  this.emit});
  final BaseEmit? emit;
  // final List<WorkerModel> workers;

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
      itemBuilder: (context, index) => WorkerCardWidget(worker: workers[index]),
    );
  }
}



class WorkerCardWidget extends StatelessWidget {
  const WorkerCardWidget({super.key, required this.worker});
  final WorkerItem worker;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(worker.name, style: AppTextStyles.font16SemiBold),
              if(worker.role!=null)
              Text(worker.role!, style: AppTextStyles.font14Regular.copyWith(color: Theme.of(context).primaryColor)),
              const SizedBox(height: AppSizes.s8),
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
              const SizedBox(height: AppSizes.s4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${'certificate_expiry'.tr()} : ${worker.dob}',
                    style: AppTextStyles.font12Regular,
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.s8),
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
                onTap: () =>context.push(AddWorkerRoute(args: .new(workerId: worker.id))),
                child: Icon(Icons.edit_outlined, color: Theme.of(context).primaryColor, size: 20),
              ),
              const SizedBox(height: AppSizes.s12),
              InkWell(
                onTap: () {},
                child:   Icon(Icons.delete_outline, color: context.theme.colorScheme.secondary, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}







