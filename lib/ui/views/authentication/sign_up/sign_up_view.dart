import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/custom_button.dart';
import 'package:vecul/ui/widgets/custom_text_field_with_label.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
       // reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50.h),
            const CustomTextFieldWithLabel(
              label: 'Full name',
              hintText: 'John Doe',
            ),
            SizedBox(height: 24.h),
            const CustomTextFieldWithLabel(
              label: 'Email',
              hintText: 'johndoe@gmail.com',
            ),
            SizedBox(height: 24.h),
            const CustomTextFieldWithLabel(
              label: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 24.h),
            const CustomTextFieldWithLabel(
              label: 'Confirm Password',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 44.h),
            CustomButton(text: 'Sign Up', onTap: (){}),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
