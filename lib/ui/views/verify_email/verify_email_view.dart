import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/verify_email/verify_email_view_model.dart';
import 'package:vecul/ui/widgets/custom_button.dart';
import 'package:vecul/ui/widgets/otp_field.dart';

class VerifyEmailView extends StatelessWidget {
  final String emailAddress;
  const VerifyEmailView({Key? key, required this.emailAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: locator<NavigatorService>().goBack,
          icon: const Icon(Icons.close, color: AppColors.black4F),
        ),
        title: Text(
          'Verify Email',
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.black4F,
          ),
        ),
      ),
      body: ViewModelBuilder<VerifyEmailViewModel>.reactive(
        builder: (context, model, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 60.h),
                Text(
                  'Code has been sent to $emailAddress',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.black4F,
                  ),
                ),
                SizedBox(height: 35.r),
                OTPField(
                  length: 6,
                  controller: model.otpController,
                ),
                SizedBox(height: 32.h),
                Text.rich(
                  TextSpan(
                    text: 'Didn’t recieve code?',
                    children: [
                      TextSpan(
                          text: ' Resend',
                          style: const TextStyle(
                            color: AppColors.blue00,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              model.resendOTP(emailAddress);
                            }),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 17.h),
                CustomButton(
                    text: 'Verify and Create',
                    isLoading: model.isBusy,
                    onTap: () {

                      model.verifyEmail(emailAddress);
                    }),
              ],
            ),
          );
        },
        viewModelBuilder: () => VerifyEmailViewModel(),
        createNewModelOnInsert: true,
      ),
    );
  }
}
