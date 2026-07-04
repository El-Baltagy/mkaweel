import 'package:flutter/Material.dart';
 import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/base_text_input_data.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.data,
  });

  final BaseTextInputData data;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: data.field?.$2,
      key:data.field?.$1,
      controller: data.controller,
      keyboardType: data.keyboardType,
      readOnly: data.readOnly,
      enabled: data.enabled,
      obscureText: data.obscureText,
      validator: data.validator,
      inputFormatters: data.inputFormatters,
      onTap: data.onTap,
       decoration: InputDecoration(
         hintStyle: const TextStyle(
           color: AppColors.contractorGreyText
         ),
         labelStyle: const TextStyle(
             color: AppColors.contractorGreyText
         ),
        hintText:  data.isLabel?null:data.labelText ,
        labelText: data.isLabel?data.labelText:null,
        prefixIcon: Icon(
          data.icon,
          color: Theme.of(context).primaryColor,
        ),
        filled: true,
        fillColor: context.theme.scaffoldBackgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.s12),
        ),
      ),
    );
  }
}