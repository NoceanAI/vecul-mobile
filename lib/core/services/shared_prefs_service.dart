import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vecul/core/locator.dart';
import 'package:vecul/core/models/user.dart';

class SharedPrefsService {
  SharedPrefsService._();

  static final SharedPrefsService _instance = SharedPrefsService._();

  factory SharedPrefsService()=>_instance;

  final SharedPreferences _sharedPrefs = locator<SharedPreferences>();
  final String userKey = 'user';
  final JsonDecoder _decoder = const JsonDecoder();

  Future<void> saveUser(User user){
    return _sharedPrefs.setString(userKey, json.encode(user.toJson()));
  }

  User getUser(){
    String data = _sharedPrefs.getString(userKey)??'';
    return User.fromJson(json.decode(data));
  }

  removeUser(){
    return _sharedPrefs.remove(userKey);
  }
}