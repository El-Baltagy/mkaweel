import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';

class WorkerModel {

  const WorkerModel({
    required this.name,
    required this.role,
    required this.phone,
    required this.certExpiry,
    required this.isActive,
  });
  final String name;
  final String role;
  final String phone;
  final String certExpiry;
  final bool isActive;
}

class WorkersListWidget extends StatelessWidget {
  const WorkersListWidget({super.key, required this.workers});
  final List<WorkerModel> workers;

  @override
  Widget build(BuildContext context) {
    if (workers.isEmpty) return const EmptyWorkersWidget();
    return ListView.separated(
      padding: const EdgeInsets.all(AppPadding.p16),
      itemCount: workers.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.s12),
      itemBuilder: (context, index) => WorkerCardWidget(worker: workers[index]),
    );
  }
}

class EmptyWorkersWidget extends StatelessWidget {
  const EmptyWorkersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.group_outlined, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: AppSizes.s16),
          Text(
            'no_workers'.tr(),
            style: AppTextStyles.font18SemiBold.copyWith(color: Colors.grey.shade500),
          ),
          const SizedBox(height: AppSizes.s8),
          Text(
            'press_to_add_worker'.tr(),
            style: AppTextStyles.font14Regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class WorkerCardWidget extends StatelessWidget {
  const WorkerCardWidget({super.key, required this.worker});
  final WorkerModel worker;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.contractorSurface,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        border: Border.all(color: AppColors.contractorLightGrey),
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
          const CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.contractorLightGrey,
            child: Icon(Icons.person_outline, color: AppColors.contractorGreyText),
          ),
          const SizedBox(width: AppSizes.s12),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(worker.name, style: AppTextStyles.font16SemiBold),
              Text(worker.role, style: AppTextStyles.font14Regular.copyWith(color: Theme.of(context).primaryColor)),
              const SizedBox(height: AppSizes.s8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.phone_outlined, size: 16, color: AppColors.contractorGreyText),
                  const SizedBox(width: AppSizes.s4),
                  Text(worker.phone, style: AppTextStyles.font14Regular),

                ],
              ),
              const SizedBox(height: AppSizes.s4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${'certificate_expiry_label'.tr()} ${worker.certExpiry}',
                    style: AppTextStyles.font12Regular,
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.s8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p4),
                decoration: BoxDecoration(
                  color: worker.isActive
                      ? AppColors.contractorGreen.withOpacity(0.15)
                      : Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppSizes.s20),
                ),
                child: Text(
                  worker.isActive ? 'active'.tr() : 'inactive'.tr(),
                  style: AppTextStyles.font12Regular.copyWith(
                    color: worker.isActive ? AppColors.contractorGreen : AppColors.contractorGreyText,
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
                onTap: () {},
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







