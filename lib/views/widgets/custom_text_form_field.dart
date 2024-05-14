import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onPressed,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.isPassword = true,
    this.validator,
  });
  final String hintText;
  final void Function()? onPressed;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return 'the $hintText can\'t be empty';
            }
            return null;
          },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(suffixIcon),
              )
            : Icon(suffixIcon),
      ),
    );
  }
}
