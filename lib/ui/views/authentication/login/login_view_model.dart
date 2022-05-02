import 'dart:convert';
import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:vecul/core/data_sources/auth_data_source.dart';
import 'package:vecul/core/models/user.dart';
import 'package:vecul/core/services/shared_prefs_service.dart';
import 'package:vecul/ui/exports.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthDataSource _authDataSource = AuthDataSource();
  final NavigatorService _navService = locator<NavigatorService>();
  final DialogService _dialogService = locator<DialogService>();

  AutovalidateMode validationMode = AutovalidateMode.disabled;

  void tryLogin(){
    if(formKey.currentState!.validate()){
      _login();
    }else{
      validationMode = AutovalidateMode.onUserInteraction;
      notifyListeners();
    }
  }
  
  ///Makes API request to login and get user data using the AuthDataSource
  void _login() async {
    setBusy(true);
    try {
      var data  = await _authDataSource.login(body: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      });
      var user = User.fromJson(data);
      SharedPrefsService().saveUser(user);
      setBusy(false);
      _navService.pushNamed(indexView);
    } catch (e) {
      setBusy(false);
      if(e.toString().contains("User is not confirmed")){
        _dialogService.showWarningDialog("Account not confirmed");
        await resendOTP(emailController.text.trim());
        _navService.pushReplacementNamed(verifyEmailView, arguments: emailController.text.trim());
      }else{
        _dialogService.showErrorDialog(e.toString());
      }
    }
  }

  Future resendOTP(email) async{
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
  
  ///Validator for email address
  String? emailValidator(String? email){
    if (email == null || email.isEmpty) return 'Please enter an email address';
    if (!EmailValidator.validate(email)){
      return 'Invalid email address';
    }
    return null;
  }
  ///Validator for password
  String? passwordValidator(String? password){
    if (password == null || password.isEmpty) return 'Please enter a password';
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
