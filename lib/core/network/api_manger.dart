import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:neshra/core/network/constants.dart';
import 'package:neshra/core/network/dio_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@injectable
class ApiManger {
  late final Dio dio;

  ApiManger() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: {"X-Api-Key": Constants.apiKey},
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(DioInterceptor());
    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestBody: true,
    //     requestHeader: true,
    //     responseBody: true,
    //     request: true,
    //   ),
    // );
  }

  Future<Response> getApi(String endpoint, {Map<String, dynamic>? params}) {
    return dio.get(endpoint, queryParameters: params);
  }
}
