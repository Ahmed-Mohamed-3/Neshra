sealed class Failure {
  const Failure();
}

class NoInternetFailure extends Failure {
  const NoInternetFailure();
}

class TimeoutFailure extends Failure {
  const TimeoutFailure();
}

class NotFoundFailure extends Failure {
  const NotFoundFailure();
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({this.statusCode});
}

class UnknownFailure extends Failure {
  const UnknownFailure();
}
