import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/forgot_password/forgot_password_view_model.dart';
import 'package:vecul/ui/widgets/custom_button.dart';
import 'package:vecul/ui/widgets/custom_textfield.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20.r,
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: const Color(0xFF0D1C2E),
            size: 25.r,
          ),
          onPressed: () {
            locator<NavigatorService>().goBack();
          },
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.black4F,
            fontWeight: FontWeight.w500,
          ),
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ViewModelBuilder<ForgotPasswordViewModel>.reactive(
          builder: (context, model, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h),
                Text(
                  'Enter your recovery Email with which you will recieve an OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.grey82,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 42.h),
                const CustomTextField(textInputAction: TextInputAction.done, hintText: 'example@email.com'),
                SizedBox(height: 20.h),
                CustomButton(text: 'Continue', onTap: model.requestOTP,),
              ],
            );
          }, viewModelBuilder: ()=>ForgotPasswordViewModel(),
        ),
      ),
    );
  }
}
