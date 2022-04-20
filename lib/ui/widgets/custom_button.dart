import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  const CustomButton({Key? key, required this.text, required this.onTap, this.buttonColor, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63.h,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor??AppColors.blue00,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          )
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor??AppColors.white,
            fontWeight: FontWeight.w300,
            fontSize: 18.sp,
            fontFamily: sfUI,
          ),
        ),
      ),
    );
  }
}
