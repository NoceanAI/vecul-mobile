import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/custom_button.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  const SuccessDialog({Key? key, this.message = '', this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      content: SizedBox(
        height: 300.r,
        width: 300.r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 45.h),
            Container(
              height: 64.r,
              width: 64.r,
              child: Icon(
                Icons.check_rounded,
                color: AppColors.white,
                size: 47.r,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.green,
              ),
            ),
            SizedBox(height: 20.h),
             Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF1F1F39),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey82,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 13.h),
            CustomButton(
              text: 'Done',
              onTap: Navigator.of(context).pop,
            ),
          ],
        ),
      ),
    );
  }
}
