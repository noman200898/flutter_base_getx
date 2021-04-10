import 'dart:io';
import 'package:base_application/core/failure/exceptions/network_exception.dart';
import 'package:base_application/utils/shared_pref_utils.dart';
import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import 'dio_factory.dart';

class ApiBaseHelper{

  final DioFactory dioFactory;

  ApiBaseHelper({required this.dioFactory});

  Future<Response> get(String endUrl) async {
    await setToken();
    try {
      // make the network call
      final response = await dioFactory.getDio().get(NetworkConstants.BASE_URL+endUrl);
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> getWithParams(String endUrl, Map<String, dynamic> params) async {
    await setToken();
    try {
      // make the network call
      final response = await dioFactory.getDio().get(
        NetworkConstants.BASE_URL+endUrl,
        queryParameters: params
      );
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> postWithParams(String endUrl, Map<String, dynamic> params) async {
    await setToken();
    try {
      // make the network call
      final response = await dioFactory.getDio().post(
          NetworkConstants.BASE_URL+endUrl,
          queryParameters: params
      );
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
  

  Future<Response> post(String endUrl, Map<String, dynamic> body) async {
    await setToken();
    try {
      // make the network call
      final response = await dioFactory.getDio().post(
          NetworkConstants.BASE_URL+endUrl,
          data: body,
      );
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> postMultiPart(String endUrl,String key, File file) async {
    await setToken();

    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      key : await MultipartFile.fromFile(file.path, filename:fileName),
    });

    try {
      // make the network call
      final response = await dioFactory.getDio().post(
        NetworkConstants.BASE_URL+endUrl,
        data: formData,
      );

      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<void> setToken() async{
    var token = await SharedPrefUtil.getString(KeyConstants.TOKEN_KEY);
    dioFactory.getDio().options = BaseOptions(
        headers: {
          NetworkConstants.ACCEPT : NetworkConstants.ACCEPT_TYPE,
          NetworkConstants.AUTHORIZATION : token,
        }
    );
  }

}


Response _returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
      break;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
    case 403:
      var responseJson = response.data;
      throw UnauthorisedException(responseJson["message"].toString());
    case 500:
    default:
      throw FetchDataException('Error occurred while Communication with '
          'Server with StatusCode : ${response.statusCode}');
  }
}