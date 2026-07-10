import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
 import 'package:mkaweel/core/shared/widgets/text_inputs/base_text_input_data.dart';

class PasswordInputData extends BaseTextInputData {
  PasswordInputData({
    super.controller,
    String? labelText,
    String? Function(String?)? validator,
  super.isLabel,
    super.field
  }) : super(
    icon: Icons.lock,
       isObscureText: true,
       labelText: labelText??'password'.tr(),
    validator: validator??(value) {
      if (value?.isEmpty == true) {
        return "can't_be_empty".tr();
      }
      return null;
    },
  );
}