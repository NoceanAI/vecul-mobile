import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:vecul/core/models/car.dart';
import 'package:vecul/core/networking/endpoints.dart';
import 'package:vecul/core/networking/network_helper.dart';
import 'package:vecul/ui/exports.dart';

class CarDataSource {
  final Endpoints _endpoints = Endpoints();
  final NetworkHelper _networkHelper = locator<NetworkHelper>();
  final _decoder = const JsonDecoder();
  final SharedPrefsService _prefsService = SharedPrefsService();

  Future<dynamic> addCar({required Map<String, dynamic> body}) async {
    try {
      var json = _decoder.convert(
          await _networkHelper.post(_endpoints.createCarUrl, body: body, headers: {
            'username': _prefsService.getUser().email,
      }));
      log(json);
      if (json['statusCode'] == 200) {
        return ''; //Tokens.fromJson(json['body']['data']);
      } else {
        throw json['body']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Car>> listCars() async {
    try {
      var json = _decoder.convert(
          await _networkHelper.get(_endpoints.listCarsUrl, headers: {
         'username': _prefsService.getUser().email,
      }));
      // log(json.toString());
      return (json as List).map((e) => Car.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }


}
