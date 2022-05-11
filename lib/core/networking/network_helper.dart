import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:vecul/core/networking/error_handler.dart';

import 'api.dart';

class NetworkHelper extends API{
  final ErrorHandler _errorHandler = ErrorHandler();

  @override
  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    if (kDebugMode) {
      print(
          """
        GET
        url: $url,
        headers: $headers,
        """
      );}
    try {
      headers ??= {};
      headers['Content-Type'] = 'application/json';
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw 'Error occurred, please try again';
      }
      return response.body;
    } catch (e) {
      _errorHandler(e);
    }
  }

  @override
  Future<dynamic> post(String url, {Map<String, String>? headers, body}) async{

    if (kDebugMode) {
      print(
        """
        POST
        url: $url,
        headers: $headers,
        body: $body
        """
    );
    }
    try {
      headers ??= {};
      headers['Content-Type'] = 'application/json';
      http.Response response = await http.post(Uri.parse(url), headers: headers, body: json.encode(body) );
      final int statusCode = response.statusCode;
      if (kDebugMode) {
        print(response.body);
      }
      if (statusCode < 200 || statusCode > 400) {
        throw 'Error occurred, please try again';
      }
      return response.body;
    } catch (e) {
      _errorHandler(e);
    }
  }

  @override
  Future<dynamic> put(String url, {Map<String, String>? headers, body}) async{
    if (kDebugMode) {
      print(
          """
        PUT
        url: $url,
        headers: $headers,
        body: $body
        """
      );}
    try {
      headers ??= {};
      headers['Content-Type'] = 'application/json';
      http.Response response = await http.put(Uri.parse(url), headers: headers, body: body);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw 'Error occurred, please try again';
      }
      return response.body;
    } catch (e) {
      _errorHandler(e);
    }
  }

  @override
  Future<dynamic> patch(String url, {Map<String, String>? headers, body}) async{
    if (kDebugMode) {
      print(
          """
        PATCH
        url: $url,
        headers: $headers,
        body: $body
        """
      );}
    try {
      headers ??= {};
      headers['Content-Type'] = 'application/json';
      http.Response response = await http.patch(Uri.parse(url), headers: headers, body: body);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw 'Error occurred, please try again';
      }
      return response.body;
    } catch (e) {
      _errorHandler(e);
    }
  }

  @override
  Future<dynamic> delete(String url, {Map<String, String>? headers}) async{
    if (kDebugMode) {
      print(
          """
        DELETE
        url: $url,
        headers: $headers,
        """
      );}
    try {
      headers ??= {};
      headers['Content-Type'] = 'application/json';
      http.Response response = await http.delete(Uri.parse(url), headers: headers);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw 'Error occurred, please try again';
      }
      return response.body;
    } catch (e) {
      _errorHandler(e);
    }
  }

  Future<dynamic> postForm(String url, List<http.MultipartFile> files, {Map<String, String>? headers,Map<String, String>? body}) async {

    if (kDebugMode) {
      print(
          """
        POST FORM
        url: $url,
        headers: $headers,
        """
      );}
    try {
      print(files);
      headers!['Content-Type'] = 'image/jpg';
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields.addAll(body!);
      request.files.addAll(files);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final int statusCode = response.statusCode;
      final dynamic res = json.decode(response.body);
      // log(res.toString().toString());
      if (statusCode < 200 || statusCode > 400) throw res;
      return res;
    } catch (e) {
      rethrow;
    }
  }
}