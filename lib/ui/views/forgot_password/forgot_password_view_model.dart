import 'package:flutter/cupertino.dart';
import 'package:vecul/ui/exports.dart';

class ForgotPasswordViewModel extends BaseViewModel{
  final TextEditingController emailController = TextEditingController();

  void requestOTP(){
    ///Do something to request OTP
    locator<NavigatorService>().pushNamed(verifyEmailView, arguments: 'example@email.com');
  }
}