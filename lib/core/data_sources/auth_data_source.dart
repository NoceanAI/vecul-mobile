import 'dart:convert';

import 'package:vecul/core/locator.dart';
import 'package:vecul/core/models/tokens.dart';
import 'package:vecul/core/models/user.dart';
import 'package:vecul/core/networking/endpoints.dart';
import 'package:vecul/core/networking/network_helper.dart';
import 'package:vecul/core/services/shared_prefs_service.dart';

class AuthDataSource {
  final Endpoints _endpoints = Endpoints();
  final NetworkHelper _networkHelper = locator<NetworkHelper>();
  final _decoder = const JsonDecoder();
  final SharedPrefsService _prefsService = SharedPrefsService();

  Future<Tokens> login({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder
          .convert(await _networkHelper.post(_endpoints.loginUrl, body: body));
      if (json['statusCode'] == 200) {
        return Tokens.fromJson(json['body']['data']);
      } else {
        throw json['body']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser() async {
    print(_prefsService.getTokens().accessToken);
    try {
      var json = _decoder.convert(
        await _networkHelper.post(
          _endpoints.getUserByAccessTokenUrl,
          body: {
            'access_token': _prefsService.getTokens().accessToken,
          },
          // headers: {
          //   ''
          // }
        ),
      );
      if (json['statusCode'] == 200) {
        return User.fromJson(json['body']);
      } else {
        throw json['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUp({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder
          .convert(await _networkHelper.post(_endpoints.signUpUrl, body: body));

      if (json['statusCode'] == 200) {
        return json['message'];
      } else {
        throw json['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> confirmSignUp({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder.convert(
          await _networkHelper.post(_endpoints.confirmSignUpUrl, body: body));

      if (json['statusCode'] == 200) {
        return json['message'];
      } else {
        throw json['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> resendCode({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder.convert(
          await _networkHelper.post(_endpoints.resendCodeUrl, body: body));
      if (json['statusCode'] == 200) {
        return json['message'];
      } else {
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
