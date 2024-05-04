import '../data/models/common/common_error_response.dart';

class ServerException implements Exception {
  final ErrorResponseModel errorResponseModel;

  ServerException(this.errorResponseModel);
}

class APIFailException implements Exception {
  final ErrorResponseModel errorResponseModel;

  APIFailException(this.errorResponseModel);
}

class CacheException implements Exception {}

class UnAuthorizedException implements Exception {
  final ErrorResponseModel errorResponseModel;

  UnAuthorizedException(this.errorResponseModel);
}

class DioExceptionError implements Exception {
  final ErrorResponseModel errorResponseModel;

  DioExceptionError({required this.errorResponseModel});
}