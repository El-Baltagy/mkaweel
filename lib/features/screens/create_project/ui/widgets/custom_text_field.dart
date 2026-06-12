import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';

class CustomTextField extends StatelessWidget {

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon,
  });
  final String label;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.font14Regular.copyWith(color: context.theme.colorScheme.tertiaryFixed)),
        10.verticalSpace,
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText.withOpacity(0.5)),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: context.theme.scaffoldBackgroundColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide:   BorderSide(color: context.theme.canvasColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide:   BorderSide(color: context.theme.canvasColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide:   BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
