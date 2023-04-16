import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIService {
  static const url = 'http://94.131.97.26:8080';

  static Future<dynamic> postRequest(
      {required String request,
      Map<String, String> queryParameters = const {},
      Map<String, String> data = const {}}) async {
    try {
      var response = await Dio()
          .post('$url/$request', queryParameters: queryParameters, data: data);
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
    return '';
  }

  static Future<dynamic> getRequest(
      {required String request,
      Map<String, String> queryParameters = const {},
      Map<String, String> data = const {}}) async {
    try {
      var response = await Dio().get(
        '$url/$request',
        queryParameters: queryParameters,
        data: data,
      );
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
    return '';
  }

  static Future<dynamic> putRequest(
      {required String request,
      Map<String, String> queryParameters = const {},
      Map<String, String> data = const {}}) async {
    try {
      var response = await Dio()
          .put('$url/$request', queryParameters: queryParameters, data: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return '';
    }
    return '';
  }
}
