import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/custom_button.dart';
import 'package:vecul/ui/widgets/custom_text_field_with_label.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50.h),
            const CustomTextFieldWithLabel(
              label: 'Email',
              hintText: 'John@gmail.com',
            ),
            SizedBox(height: 24.h),
            const CustomTextFieldWithLabel(
              label: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.done,
              textFieldType: TextFieldType.password,
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: CupertinoButton(
            //     padding: EdgeInsets.zero,
            //       child: Text(
            //     'Forgot password',
            //     style: TextStyle(
            //       fontSize: 11.sp,
            //       fontFamily: sfPro,
            //       color: AppColors.grey82,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ), onPressed: (){}),
            // ),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Login',
              onTap: () {
                locator<NavigatorService>().pushNamed(indexView);
              },
            ),
            // CustomButton(
            //   text: 'Forgot Password',
            //   textColor: AppColors.blue00,
            //   buttonColor: Colors.transparent,
            //   fontSize: 15.sp,
            //   onTap: () {
            //     locator<NavigatorService>().pushNamed(indexView);
            //   },
            // ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 63.h,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    )),
                onPressed: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: AppColors.blue00,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    fontFamily: sfUI,
                  ),
                ),
              ),
            ),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
