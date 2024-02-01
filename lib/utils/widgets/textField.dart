import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//Custom TextField helper widget for our app
class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int maxLines;
  final bool obscureText;
  final bool readOnly;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final VoidCallback? onTap;
  final void Function(String)? onChange;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  const TextFieldWidget({
    Key? key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.textInputType = TextInputType.number,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.onTap,
    this.onChange,
    this.contentPadding,
    this.fillColor,
    this.filled = false,
    this.enabledBorder,
    this.focusedBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //if textField is readonly
      readOnly: readOnly,
      onChanged: onChange ?? (value) {},
      keyboardType: textInputType,
      onTap: onTap,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: filled,
        fillColor: fillColor,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // contentPadding: contentPadding ?? EdgeInsets.only(left: 5.w),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
        //increase length of textfield
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            // color: Colors.black,
            color: const Color(0xFFEEEEEE),
          ),
        ),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide(
            // color: Colors.black,
            color: const Color(0xFFEEEEEE),
          ),
        ),
      ),
      maxLines: maxLines,

      //If validator is not given , it will use this validation by default
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Enter your $hintText";
            }
            return null;
          },
    );
  }
}
