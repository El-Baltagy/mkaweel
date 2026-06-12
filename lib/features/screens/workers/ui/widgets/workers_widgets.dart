import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

class WorkerModel {
  final String name;
  final String role;
  final String phone;
  final String certExpiry;
  final bool isActive;

  const WorkerModel({
    required this.name,
    required this.role,
    required this.phone,
    required this.certExpiry,
    required this.isActive,
  });
}

class WorkersListWidget extends StatelessWidget {
  final List<WorkerModel> workers;
  const WorkersListWidget({super.key, required this.workers});

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
  final WorkerModel worker;
  const WorkerCardWidget({super.key, required this.worker});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Right side info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(worker.name, style: AppTextStyles.font16SemiBold),
                        Text(worker.role, style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorTeal)),
                      ],
                    ),
                    const SizedBox(width: AppSizes.s12),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColors.contractorLightGrey,
                      child: const Icon(Icons.person_outline, color: AppColors.contractorGreyText),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.s8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(worker.phone, style: AppTextStyles.font14Regular),
                    const SizedBox(width: AppSizes.s4),
                    const Icon(Icons.phone_outlined, size: 16, color: AppColors.contractorGreyText),
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
          ),
          // Action icons
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(Icons.edit_outlined, color: AppColors.contractorTeal, size: 20),
              ),
              const SizedBox(height: AppSizes.s12),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.delete_outline, color: AppColors.contractorRed, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WorkersSummaryWidget extends StatelessWidget {
  final int activeCount;
  final int inactiveCount;
  const WorkersSummaryWidget({super.key, required this.activeCount, required this.inactiveCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Row(
        children: [
          Expanded(
            child: _SummaryCard(
              count: inactiveCount,
              label: 'inactive'.tr(),
              countColor: AppColors.contractorDarkText,
            ),
          ),
          const SizedBox(width: AppSizes.s12),
          Expanded(
            child: _SummaryCard(
              count: activeCount,
              label: 'active_worker'.tr(),
              countColor: AppColors.contractorTeal,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final int count;
  final String label;
  final Color countColor;
  const _SummaryCard({required this.count, required this.label, required this.countColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
        color: AppColors.contractorSurface,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        border: Border.all(color: AppColors.contractorLightGrey),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: AppTextStyles.font24Bold.copyWith(color: countColor, fontSize: 32),
          ),
          const SizedBox(height: AppSizes.s4),
          Text(label, style: AppTextStyles.font14Regular),
        ],
      ),
    );
  }
}

class WorkersFilterWidget extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  const WorkersFilterWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = ['all_workers', 'active', 'inactive'];
    final labels = ['all_workers'.tr(), 'active'.tr(), 'inactive'.tr()];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(filters.length, (i) {
          final isSelected = selectedFilter == filters[i];
          return Padding(
            padding: const EdgeInsets.only(left: AppPadding.p8),
            child: GestureDetector(
              onTap: () => onFilterChanged(filters[i]),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.contractorTeal : AppColors.contractorSurface,
                  borderRadius: BorderRadius.circular(AppSizes.s20),
                  border: Border.all(color: isSelected ? AppColors.contractorTeal : AppColors.contractorLightGrey),
                ),
                child: Text(
                  labels[i],
                  style: AppTextStyles.font14Regular.copyWith(
                    color: isSelected ? AppColors.white : AppColors.contractorGreyText,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

void showAddWorkerBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const AddWorkerBottomSheet(),
  );
}

class AddWorkerBottomSheet extends StatefulWidget {
  const AddWorkerBottomSheet({super.key});
  @override
  State<AddWorkerBottomSheet> createState() => _AddWorkerBottomSheetState();
}

class _AddWorkerBottomSheetState extends State<AddWorkerBottomSheet> {
  final _nameController = TextEditingController();
  final _specController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, scrollController) => Container(
        decoration: const BoxDecoration(
          color: AppColors.contractorSurface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.s24)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppSizes.s12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.contractorLightGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(AppPadding.p20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                      Text('add_worker'.tr(), style: AppTextStyles.font18SemiBold),
                      const SizedBox(width: 40),
                    ],
                  ),
                  const SizedBox(height: AppSizes.s20),
                  _buildLabel('worker_name'.tr()),
                  _buildTextField(_nameController, 'full_name'.tr()),
                  const SizedBox(height: AppSizes.s16),
                  _buildLabel('specialization'.tr()),
                  _buildTextField(_specController, 'building'.tr()),
                  const SizedBox(height: AppSizes.s16),
                  _buildLabel('phone_number'.tr()),
                  _buildTextField(_phoneController, '+966 5x xxx xxxx'),
                  const SizedBox(height: AppSizes.s16),
                  _buildLabel('certificate_expiry'.tr()),
                  _buildDatePicker(context),
                  const SizedBox(height: AppSizes.s16),
                  _buildLabel('notes'.tr()),
                  _buildTextField(_notesController, 'worker_notes_hint'.tr(), maxLines: 3),
                  const SizedBox(height: AppSizes.s24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.contractorTeal,
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.s12)),
                      ),
                      child: Text('save'.tr(), style: AppTextStyles.font16SemiBold.copyWith(color: AppColors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) => Padding(
        padding: const EdgeInsets.only(bottom: AppPadding.p8),
        child: Text(label, style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorDarkText), textAlign: TextAlign.right),
      );

  Widget _buildTextField(TextEditingController ctrl, String hint, {int maxLines = 1}) => TextField(
        controller: ctrl,
        maxLines: maxLines,
        textAlign: TextAlign.right,
        // textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          // hintTextDirection: TextDirection.rtl,
          filled: true,
          fillColor: AppColors.contractorBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.s8),
            borderSide: const BorderSide(color: AppColors.contractorLightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.s8),
            borderSide: const BorderSide(color: AppColors.contractorLightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.s8),
            borderSide: const BorderSide(color: AppColors.contractorTeal),
          ),
        ),
      );

  Widget _buildDatePicker(BuildContext context) => InkWell(
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030),
          );
          if (date != null) setState(() => _selectedDate = date);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p14),
          decoration: BoxDecoration(
            color: AppColors.contractorBackground,
            borderRadius: BorderRadius.circular(AppSizes.s8),
            border: Border.all(color: AppColors.contractorLightGrey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.calendar_today_outlined, color: AppColors.contractorGreyText),
              Text(
                _selectedDate != null
                    ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                    : 'mm/dd/yyyy',
                style: AppTextStyles.font14Regular,
              ),
            ],
          ),
        ),
      );
}
