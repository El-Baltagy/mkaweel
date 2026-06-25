import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:mkaweel/core/constants/AppRegEx.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.field1,
    required this.phoneController,
  });

  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: field1.$1,
      focusNode: field1.$2,
      autovalidateMode: .onUserInteraction,
      controller: phoneController,
      keyboardType: TextInputType.emailAddress,
      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'email'.tr(),
        prefixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value?.isEmpty == true) {
          return "can't_be_empty".tr();
        }
        if(!AppRegEx.regExpValidEmail.hasMatch(value!)){
          return 'please_enter_valid_email'.tr();
        }
        return null;
      },
    );
  }
}