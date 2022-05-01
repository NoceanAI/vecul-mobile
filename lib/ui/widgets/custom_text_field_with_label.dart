import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

enum TextFieldType { regular, password }

class CustomTextFieldWithLabel extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final TextFieldType textFieldType;
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
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType,
      this.textFieldType = TextFieldType.regular})
      : super(key: key);

  @override
  State<CustomTextFieldWithLabel> createState() =>
      _CustomTextFieldWithLabelState();
}

class _CustomTextFieldWithLabelState extends State<CustomTextFieldWithLabel> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(5.r),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w500,
            fontFamily: sfPro,
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          validator: widget.validator,
          obscureText: _showPassword,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          style: TextStyle(
            fontFamily: sfPro,
            color: AppColors.black33,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.textFieldType == TextFieldType.password
                ? GestureDetector(
                    child: Icon(
                      _showPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.grey82.withOpacity(0.53),
                      size: 18.r,
                    ),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  )
                : null,
            suffixIconColor: AppColors.grey82.withOpacity(0.53),
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.r, horizontal: 16.r),
            fillColor: AppColors.whiteF9,
            filled: true,
            border: border,
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: const BorderSide(color: AppColors.blue00),
            ),
            hintText: widget.textFieldType == TextFieldType.password
                ? '********'
                : widget.hintText,
            hintStyle: TextStyle(
              fontFamily: sfPro,
              color: AppColors.grey82.withOpacity(0.53),
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
