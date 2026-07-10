import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
 import 'package:mkaweel/core/shared/widgets/text_inputs/base_text_input_data.dart';

class PasswordInputData extends BaseTextInputData {
  PasswordInputData({
    super.controller,
    String? labelText,
  super.isLabel,
    super.field
  }) : super(
    icon: Icons.lock,
       // enableObsecureText: true,
       // enableObsecureTxtToogle: true,
       labelText: labelText??'password'.tr(),
    validator: (value) {
      if (value?.isEmpty == true) {
        return "can't_be_empty".tr();
      }
      return null;
    },
  );
}