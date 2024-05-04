import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  const ErrorResponse({
    required this.responseCode,
    required this.responseError,
  });

  final String responseCode;
  final String responseError;

  @override
  List<Object> get props => [responseError, responseCode];
}