class NoInternetException implements Exception {}

class TimeoutException implements Exception {}

class NotFoundException implements Exception {}

class ServerException implements Exception {
  final int? statusCode;
  final String? message;

  ServerException({this.statusCode, this.message});
}

class UnknownException implements Exception {}
