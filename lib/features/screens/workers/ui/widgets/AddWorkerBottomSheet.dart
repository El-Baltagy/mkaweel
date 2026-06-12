import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

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