import 'dart:io';

import 'package:dio/dio.dart';
import 'package:neshra/core/error/exception.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.cancel) {
      return handler.next(err);
    }
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      return handler.reject(err.copyWith(error: TimeoutException()));
    }
    if (err.error is SocketException ||
        err.type == DioExceptionType.connectionError) {
      return handler.reject(err.copyWith(error: NoInternetException()));
    }
    final status = err.response?.statusCode;
    if (status == 404) {
      return handler.reject(err.copyWith(error: NotFoundException()));
    }

    if (status != null && status >= 500) {
      return handler.reject(
        err.copyWith(error: ServerException(statusCode: status)),
      );
    }

    return handler.reject(err.copyWith(error: UnknownException()));
  }
}
