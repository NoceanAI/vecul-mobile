import 'dart:convert';

import 'package:vecul/core/locator.dart';
import 'package:vecul/core/networking/endpoints.dart';
import 'package:vecul/core/networking/network_helper.dart';

class AuthDataSource{
  final Endpoints _endpoints = Endpoints();
  final NetworkHelper _networkHelper = locator<NetworkHelper>();
  final _decoder = const JsonDecoder();
  Future<dynamic> login({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder
          .convert(await _networkHelper.post(_endpoints.loginUrl, body: body));
      if (json['statusCode'] == 200){
        return json['body']['data'];
      }else{
        throw json['body']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> signUp({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder
          .convert(await _networkHelper.post(_endpoints.signUpUrl, body: body));

      if (json['statusCode'] == 200){
        return json['message'];
      }else{
        throw json['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> confirmSignUp({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder
          .convert(await _networkHelper.post(_endpoints.confirmSignUpUrl, body: body));

      if (json['statusCode'] == 200){
        return json['message'];
      }else{
        throw json['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> resendCode({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder
          .convert(await _networkHelper.post(_endpoints.resendCodeUrl, body: body));
      if (json['statusCode'] == 200){
        return json['message'];
      }else{
        throw json;
      }
    } catch (e) {
      rethrow;
    }
  }
}

// Future<dynamic> login({required Map<String, dynamic> body}) async {
//   try {
//     var response = await _networkHelper.post(_endpoints.loginUrl, body:body);
//     var json = _decoder.convert(response!.body);
//     if (response.statusCode == 400){
//       throw json['message'];
//     }
//     return json;
//   } catch (e) {
//     rethrow;
//   }
// }
// Future<dynamic> signUp({required Map<String, dynamic> body}) async {
//   try {
//     var response = await _networkHelper.post(_endpoints.signUpUrl, body:body);
//     var json = _decoder.convert(response!.body);
//     if (response.statusCode == 400){
//       throw json['message'];
//     }
//     return json;
//   } catch (e) {
//     rethrow;
//   }
// }