import 'package:flutter/material.dart';
import '../constants/constant.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final bool isFilled;
  final IconData prefixIconData;
  final Color iconColor;
  final Color filledColor;
  final String hintText;
  final Color focusesBorderColor;
  final Color enableBorderColor;
  final double borderRadius;
  final bool obscureText;
  final Function(String) onChange;
  final TextInputType keyboardType;
  final AutovalidateMode autovalidateMode ;
  final String? Function(String?) validate;

  const CustomTextField({
    super.key,
    required this.prefixIconData,
    required this.iconColor,
    required this.hintText,
    required this.onChange,
    this.height = 15,
    this.isFilled = true,
    this.focusesBorderColor = Constant.kMainColor,
    this.enableBorderColor = Colors.black,
    this.borderRadius = 10,
    this.obscureText = false,
    this.filledColor = Colors.white70,
    this.keyboardType = TextInputType.emailAddress,
     required this.validate, 
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
        contentPadding : EdgeInsets.all(height),
        hintText: hintText,
        fillColor: filledColor,
        filled: isFilled,
        prefixIcon: Icon(
          prefixIconData,
          color: iconColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: focusesBorderColor,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: enableBorderColor,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
