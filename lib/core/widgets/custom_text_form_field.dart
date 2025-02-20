import 'package:flutter/material.dart';
import '../utils/app_colors/app_colors.dart';
import '../utils/font_styles/font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.type,
    required this.labelText,
    required this.controller,
    this.validator,
    this.icon,
    this.onPressed,
    this.isPassword = false,
  });
  final TextInputType type;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final void Function()? onPressed;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: type,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        labelText: labelText,
        labelStyle:
            FontStyles.textStyleLight13.copyWith(fontWeight: FontWeight.w400),
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
      ),
      controller: controller,
      validator: validator,
    );
  }
}
