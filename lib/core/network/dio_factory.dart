import '../../utils/constants.dart';
import 'package:dio/dio.dart';

class DioFactory {
  static final DioFactory _singleton = DioFactory._internal();
  Dio? _dio;

  factory DioFactory() {
    return _singleton;
  }

  DioFactory._internal() {
    /*var options = BaseOptions(
      headers: {
        NetworkConstants.ACCEPT : "application/json",
      });*/
    this._dio = Dio();
    //this._dio.options = options;
    this._dio!.interceptors.add(
      LogInterceptor(
        responseHeader: false,
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  Dio getDio() => this._dio!;
}