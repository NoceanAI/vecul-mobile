import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vecul/ui/exports.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  final double? fontSize;
  final bool isLoading;
  const CustomButton({Key? key, required this.text, required this.onTap, this.buttonColor, this.textColor, this.fontSize, this.height, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??63.h,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor??AppColors.blue00,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          )
        ),
        onPressed: onTap,
        child: isLoading?const SpinKitCircle(
          color: AppColors.white,
        ):Text(
          text,
          style: TextStyle(
            color: textColor??AppColors.white,
            fontWeight: FontWeight.w400,
            fontSize: fontSize??18.sp,
            fontFamily: sfUI,
          ),
        ),
      ),
    );
  }
}
