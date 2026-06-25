import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    super.key,
    required this.field2,
    required this.passwordController,
  });

  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: field2.$1,
      focusNode: field2.$2,

      controller: passwordController,
      obscureText: true,
      autovalidateMode: .onUserInteraction,
      decoration: InputDecoration(
        labelText: 'password'.tr(),
        prefixIcon: const Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value?.isEmpty == true) {
          return "can't_be_empty".tr();
        }
        return null;
      },
    );
  }
}