import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';

class InvoiceFormWidget extends StatelessWidget {
  const InvoiceFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
            context,
            hint: 'invoice_example_hint'.tr()),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: _buildLabeledField(
                context,
                label: 'invoice_status'.tr(),
                hint: 'invoice_status_draft'.tr(),
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: _buildLabeledField(
                context,
                label: 'invoice_project'.tr(),
                hint: 'invoice_project_name_example'.tr(),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: _buildLabeledField(
                context,
                label: 'invoice_due_date'.tr(),
                hint: 'mm/dd/yyyy',
                icon: Icons.calendar_today_outlined,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: _buildLabeledField(
                context,
                label: 'invoice_tax_percentage'.tr(),
                hint: '8',
                isNumber: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLabeledField(BuildContext context,{
    required String label,
    required String hint,
    IconData? icon,
    bool isNumber = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
        ),
        8.verticalSpace,
        _buildTextField(context,hint: hint, icon: icon, isNumber: isNumber),
      ],
    );
  }

  Widget _buildTextField(BuildContext context,{required String hint, IconData? icon, bool isNumber = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isNumber ? Theme.of(context).primaryColor : AppColors.contractorLightGrey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorDarkText),
          ),
          if (icon != null) Icon(icon, color: AppColors.contractorDarkText, size: 18),
          if (isNumber)
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_drop_up, size: 16, color: AppColors.contractorGreyText),
                Icon(Icons.arrow_drop_down, size: 16, color: AppColors.contractorGreyText),
              ],
            )
        ],
      ),
    );
  }
}
