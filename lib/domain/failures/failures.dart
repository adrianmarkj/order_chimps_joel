import '../../data/models/common/common_error_response.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  final ErrorResponseModel errorResponse;

  ServerFailure(this.errorResponse);
}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {}

class ConnectionFailure extends Failure {}

class AuthorizedFailure extends Failure {
  final ErrorResponseModel errorResponse;

  AuthorizedFailure(this.errorResponse);
}

class APIFailure extends Failure {
  final ErrorResponseModel errorResponse;

  APIFailure(this.errorResponse);
}
