import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/constants/AppRegEx.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/base_text_input_data.dart';

class PasswordInputData extends BaseTextInputData {
  PasswordInputData({
    super.controller,
    super.isLabel,
    super.field
  }) : super(
    icon: Icons.lock,
      obscureText: true,
      labelText: 'password'.tr(),
    validator: (value) {
      if (value?.isEmpty == true) {
        return "can't_be_empty".tr();
      }
      return null;
    },
  );
}