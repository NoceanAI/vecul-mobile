import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints{
  static final String _baseUrl = dotenv.env['CUSTOMER_BASE_URL']!;
  static final String _coreBaseUrl = dotenv.env['CORE_BASE_URL']!;
  static final String _carBaseUrl = dotenv.env['CAR_BASE_URL']!;
  Endpoints._internal();
  static final Endpoints _instance = Endpoints._internal();

  factory Endpoints(){
    return _instance;
  }

  ///Auth endpoints
  final String loginUrl = '$_baseUrl/login';
  final String signUpUrl = '$_baseUrl/signup';
  final String confirmSignUpUrl = '$_baseUrl/confirm-signup';
  final String resendCodeUrl = '$_baseUrl/resend-code';

  ///Core endpoints
  final String getUserByAccessTokenUrl = '$_coreBaseUrl/get-user';
  final String profilePicUploadUrl = '$_coreBaseUrl/profile_pic_upload/profile_pics/';
  final String carImagesUploadUrl = '$_coreBaseUrl/car_image_upload/';

  ///Car endpoints
  final String createCarUrl = '$_carBaseUrl/create-car';
  final String listCarsUrl = '$_carBaseUrl/list-car';
}