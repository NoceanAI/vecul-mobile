import 'package:flutter/cupertino.dart';
import 'package:vecul/core/data_sources/auth_data_source.dart';
import 'package:vecul/ui/exports.dart';

class VerifyEmailViewModel extends BaseViewModel{
  final TextEditingController otpController = TextEditingController();
  final AuthDataSource _authDataSource = AuthDataSource();
  final NavigatorService _navService = locator<NavigatorService>();
  final DialogService _dialogService = locator<DialogService>();



  void verifyEmail(email) async{
    setBusy(true);
    try{
     await _authDataSource.confirmSignUp(body: {
        'username': email,
        'code': otpController.text.trim(),
      });
     setBusy(false);
     _navService.pushReplacementNamed(authView, arguments: 0);
    }catch(e){
      setBusy(false);
      _dialogService.showWarningDialog(e.toString());
    }
  }

  void resendOTP(email){
    setBusy(true);
    try{
      _authDataSource.resendCode(body: {
        'email': email,
      });
      setBusy(false);
    }catch(e){
      setBusy(false);
      _dialogService.showWarningDialog(e.toString());
    }
  }
}