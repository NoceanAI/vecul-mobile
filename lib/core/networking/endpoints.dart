import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints{
  static final String _baseUrl = dotenv.env['CUSTOMER_BASE_URL']!;
  static final String _coreBaseUrl = dotenv.env['CORE_BASE_URL']!;
  Endpoints._internal();
  static final Endpoints _instance = Endpoints._internal();

  factory Endpoints(){
    return _instance;
  }
  final String loginUrl = '$_baseUrl/login';
  final String signUpUrl = '$_baseUrl/signup';
  final String confirmSignUpUrl = '$_baseUrl/confirm-signup';
  final String resendCodeUrl = '$_baseUrl/resend-code';
  final String getUserByAccessToken = '$_coreBaseUrl/get-user';
}