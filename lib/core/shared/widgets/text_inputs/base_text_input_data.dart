import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';

abstract class BaseTextInputData {
  const BaseTextInputData({
    this.controller,
    this.keyboardType =  .text,
    this.readOnly = false,
    this.onTap,
      this.icon,
     this.field,
    this.labelText,
    this.validator,
    this.inputFormatters,
    this.widgetPrefix,
    this.obscureText = false,
    this.enabled = true,
    this.enableValidation = true,
    this.isSingleOrMultiSelect = false,
    this.isLabel = true,
  });

  final TextEditingController? controller;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  final TextInputType keyboardType;
  final bool readOnly,isSingleOrMultiSelect, enableValidation,enabled, obscureText,isLabel;

  final IconData? icon;

  final String?   labelText;
  final Widget?   widgetPrefix;

  final VoidCallback? onTap;

  final String? Function(String?)? validator;

  final List<TextInputFormatter>? inputFormatters;
}