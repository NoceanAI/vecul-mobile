import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  const CustomTextFieldWithLabel(
      {Key? key,
        this.controller,
        required this.label,
        this.hintText,
        this.validator,
        this.obscureText = false, this.textInputAction = TextInputAction.next, this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w500,
            fontFamily: sfPro,
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          validator: validator,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          style: TextStyle(
            fontFamily: sfPro,
            color: AppColors.black33,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 18.r, horizontal:16.r),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black33),
              borderRadius: BorderRadius.circular(5.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black33),
              borderRadius: BorderRadius.circular(5.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.blue00),
              borderRadius: BorderRadius.circular(5.r),
            ),
            hintText: obscureText?'***************':hintText,
            hintStyle: TextStyle(
              fontFamily: sfPro,
              color: AppColors.greyE0,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}