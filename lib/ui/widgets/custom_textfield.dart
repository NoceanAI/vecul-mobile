import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final String? prefixText;

  const CustomTextField({Key? key, this.controller, this.hintText, this.validator, required this.textInputAction, this.textInputType, this.prefixText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(5.r),
    );
    return TextFormField(
      validator: validator,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: TextStyle(
        color: AppColors.black33,
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
      ),
      decoration: InputDecoration(
        suffixIconColor: AppColors.grey82.withOpacity(0.53),
        prefixText: prefixText,
        prefixStyle: TextStyle(
          color: AppColors.black33,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
        contentPadding:
        EdgeInsets.symmetric(vertical: 18.r, horizontal: 16.r),
        fillColor: AppColors.whiteF9,
        filled: true,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppColors.blue00),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: sfPro,
          color: AppColors.grey82.withOpacity(0.53),
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
