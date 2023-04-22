import 'package:flutter/material.dart';

import '../helpers/app_color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController editingController;
  final String placeHolder;
  final bool isObscure;
  final TextInputType textInputType;

  const CustomTextField({
    required this.editingController,
    required this.placeHolder,
    required this.isObscure,
    required this.textInputType,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Must not be empty';
          }
          return null;
        },
        obscureText: widget.isObscure,
        keyboardType: widget.textInputType,
        controller: widget.editingController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.formBorderColor,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.mainColor,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.mainColor,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey.withOpacity(0.05),
          filled: true,
          labelText: widget.placeHolder,
          labelStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
