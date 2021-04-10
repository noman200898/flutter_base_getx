import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/network/api_base_helper.dart';

class RestService {
  final ApiBaseHelper helper;

  RestService({required this.helper});

  //calls base url
  Future<Response> getMessage() {
    return helper.get("");
  }

}