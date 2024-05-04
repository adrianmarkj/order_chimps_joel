import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import '../../../data/models/common/base_response.dart';
import '../../../data/models/common/common_error_response.dart';
import '../../../error/exceptions.dart';
import '../../../error/messages.dart';
import '../utils/debug_print.dart';

class APIHelper {
  late Dio dio;

  APIHelper({required this.dio}) {
    _initApiClient();
  }

  _initApiClient() {
    final logInterceptor = LogInterceptor(
      requestBody: false,
      responseBody: false,
      error: false,
      requestHeader: true,
      responseHeader: false,
    );

    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      contentType: 'application/json',
    );

    dio
      ..options = options
      ..interceptors.add(logInterceptor)
      ..options.headers["Tz"] = "Europe/London"
    ;

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient dioClient = HttpClient(context: SecurityContext(withTrustedRoots: false));
        dioClient.badCertificateCallback = (cert, host, port) => true;
        return dioClient;
      },
    );
  }

  Future<dynamic> post(
      String url, {
        @required body,
      }) async {
    PrintResponse(jsonEncode(body), type: "API REQUEST");

    try {
      final payload = jsonEncode(body);
      final response = await dio.post(url,
        data: payload,
      );

      final baseResponse = BaseResponse.fromJson(response.data);
      final responseMap = jsonDecode(response.data.toString());
      PrintResponse('$responseMap', type: "API RESPONSE");

      return responseMap;
    } on DioException catch (e) {
      if (e.response != null) {
        final int statusCode = e.response!.statusCode!;

        if (statusCode < 200 || statusCode > 400) {
          switch (statusCode) {
            case 401:
            case 403:
              throw UnAuthorizedException(ErrorResponseModel.fromJson(e.response!.data!));
            case 404:
            case 500:
              throw ServerException(
                  ErrorResponseModel(responseError: ErrorHandler.ERROR_SOMETHING_WENT_WRONG, responseCode: ''));
            default:
              throw UnAuthorizedException(ErrorResponseModel(
                  responseCode: e.response!.statusCode.toString(), responseError: e.response!.statusMessage!));
          }
        }
      } else {
        throw ServerException(
            ErrorResponseModel(responseError: ErrorHandler.ERROR_SOMETHING_WENT_WRONG, responseCode: ''));
      }
    }
  }
}
