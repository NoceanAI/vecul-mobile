import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart';
import 'package:vecul/core/networking/endpoints.dart';
import 'package:vecul/core/networking/network_helper.dart';
import 'package:vecul/ui/exports.dart';

class CoreDataSource {
  final Endpoints _endpoints = Endpoints();
  final NetworkHelper _networkHelper = locator<NetworkHelper>();
  final _decoder = const JsonDecoder();
  final SharedPrefsService _prefsService = SharedPrefsService();

  Future<dynamic> uploadPic(Map<String, dynamic> body) async {
    //print(_prefsService.getTokens().accessToken);
    try {
      var json = _decoder.convert(
        await _networkHelper.post(
          _endpoints.profilePicUploadUrl + '${_prefsService.getUser().email.split('@')[0]}.png',
          body: body,
          headers: {
            'Content-Type':'image/jpeg'
          }
        ),
      );
      return json;
      // if (json['statusCode'] == 200) {
      //   return json;
      // } else {
      //   throw json['message'];
      // }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> uploadProfilePic(Uint8List image) async {
    try {
      List<MultipartFile> files = [
        MultipartFile.fromBytes(
          'profile_pic',
          image,
          //contentType: MediaType('image', 'png'),
        ),
      ];
      var json = await _networkHelper.postForm(
          _endpoints.profilePicUploadUrl + '${_prefsService.getUser().email.split('@')[0]}.png',
          files,
          headers: {
            'username': _prefsService.getUser().email,
          },
          body: {
            'access_token': _prefsService.getTokens().accessToken,
          });
      print(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> uploadCarPics(List<String> paths) async {
    try {
      List<MultipartFile> files = [];
      for (var path in paths) {
        files.add(await MultipartFile.fromPath('carImage', path));
      }
      var json = await _networkHelper.postForm(
          _endpoints.carImagesUploadUrl +
              '${_prefsService.getUser().email.split('@')[0]}/car}',
          files,
          headers: {
            'username': _prefsService.getUser().email,
          },
          body: {
            'access_token': _prefsService.getTokens().accessToken,
          });
      print(json);
    } catch (e) {
      rethrow;
    }
  }
}
