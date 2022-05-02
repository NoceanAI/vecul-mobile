import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:vecul/core/data_sources/auth_data_source.dart';
import 'package:vecul/ui/exports.dart';

class SignUpViewModel extends BaseViewModel{
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final AuthDataSource _authDataSource = AuthDataSource();
  final NavigatorService _navService = locator<NavigatorService>();
  final DialogService _dialogService = locator<DialogService>();

  AutovalidateMode validationMode = AutovalidateMode.disabled;

  void _signUp() async {
    setBusy(true);
    try {
      var user  = await _authDataSource.signUp(body: {
        'first_name': firstnameController.text.trim(),
        'last_name': firstnameController.text.trim(),
        'password': passwordController.text.trim(),
        'email': emailController.text.trim(),
        'confirm_password': passwordController.text.trim(),
      });
      print(user);
      //SharedPrefsService().saveUser(user);
      setBusy(false);
      _navService.pushReplacementNamed(verifyEmailView, arguments: emailController.text.trim());

    } catch (e) {
      setBusy(false);
      _dialogService.showWarningDialog(e.toString());
      // if ((e)['data']['is_verified'] == false){
      // navigatorService.pushNamed(accountVerificationView, arguments: {
      //   'email': emailController.text,
      // });
    }
  }

  void trySignUp(){
    if(formKey.currentState!.validate()){
      _signUp();
    }else{
      validationMode = AutovalidateMode.onUserInteraction;
      notifyListeners();
    }
  }

  ///Validator for email address
  String? firstnameValidator(String? email){
    if (email == null || email.isEmpty) return 'Please enter your firstname';
    return null;
  }

  String? lastnameValidator(String? email){
    if (email == null || email.isEmpty) return 'Please enter your lastname';
    return null;
  }

  String? emailValidator(String? email){
    if (email == null || email.isEmpty) return 'Please enter an email address';
    if (!EmailValidator.validate(email)){
      return 'Invalid email address';
    }
    return null;
  }

  String? confirmPasswordValidator(String? password){
    if (password == null || password.isEmpty) return 'Please confirm password';
    if (password != passwordController.text) return 'Passwords do not match';
    return null;
  }
  String? passwordValidator(String? password){
    if (password == null || password.isEmpty) return 'Please enter a password';
    if (!password.contains(RegExp(r'[A-Z]'),)) return 'Password must contain at least one capital letter';
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]',)))return 'Password must contain at least one special character';
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }
}