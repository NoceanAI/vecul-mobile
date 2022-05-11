import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vecul/core/locator.dart';
import 'package:vecul/core/models/tokens.dart';
import 'package:vecul/core/models/user.dart';

class SharedPrefsService {
  SharedPrefsService._();

  static final SharedPrefsService _instance = SharedPrefsService._();

  factory SharedPrefsService()=>_instance;

  final SharedPreferences _sharedPrefs = locator<SharedPreferences>();
  final String userKey = 'user';
  final String tokensKey = 'tokens';
  final JsonDecoder _decoder = const JsonDecoder();

  Future<void> saveUser(User user){
    return _sharedPrefs.setString(userKey, json.encode(user.toJson()));
  }

  User getUser(){
    String data = _sharedPrefs.getString(userKey)??'';
    if (!_sharedPrefs.containsKey(userKey)){

    };
    return User.fromJson(json.decode(data));
  }

  Future<void> saveTokens(Tokens tokens){
    return _sharedPrefs.setString(tokensKey, json.encode(tokens.toJson()));
  }

  Tokens getTokens(){
    String data = _sharedPrefs.getString(tokensKey)??'';
    return Tokens.fromJson(json.decode(data));
  }

  removeUser(){
    return _sharedPrefs.remove(userKey);
  }
}