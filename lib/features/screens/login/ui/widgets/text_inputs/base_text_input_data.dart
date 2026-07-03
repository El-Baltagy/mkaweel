import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';

abstract class BaseTextInputData {
  const BaseTextInputData({
    this.controller,
    this.keyboardType =  .text,
    this.readOnly = false,
    this.onTap,
    required this.icon,
     this.field,
    this.labelText,
    this.validator,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.isLabel = true,
  });

  final TextEditingController? controller;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  final TextInputType keyboardType;
  final bool readOnly, enabled, obscureText,isLabel;

  final IconData icon;

  final String?   labelText;

  final VoidCallback? onTap;

  final String? Function(String?)? validator;

  final List<TextInputFormatter>? inputFormatters;
}