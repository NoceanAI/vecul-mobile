import 'package:flutter/cupertino.dart';
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
            SizedBox(height: 50.h) ,
            const CustomTextFieldWithLabel(
              label: 'Email',
              hintText: 'John@gmail.com',
            ),
            SizedBox(height: 24.h),
            const CustomTextFieldWithLabel(
              label: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                  child: Text(
                'Forgot password',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: sfPro,
                  color: AppColors.grey82,
                  fontWeight: FontWeight.w500,
                ),
              ), onPressed: (){}),
            ),
           SizedBox(
             height: 206.h,
           ),
            CustomButton(text: 'Login', onTap: (){}),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}