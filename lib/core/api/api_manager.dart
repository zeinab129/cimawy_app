import 'package:cimawy/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? header}) {
    return dio.get(Constants.BASE_URL + endPoint,
        queryParameters: params, options: Options(headers: header));
  }

  Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? header}) {
    return dio.post(Constants.BASE_URL + endPoint,
        data: body, options: Options(headers: header));
  }


}
