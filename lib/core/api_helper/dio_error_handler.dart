import 'package:dio/dio.dart';
import 'dart:io';

abstract class DioErrorHandler {
  static Failure handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return const Failure('Request was cancelled by user.');
      case DioExceptionType.connectionTimeout:
        return const Failure('Connection timeout.');
      case DioExceptionType.receiveTimeout:
        return const Failure('Receive timeout.');
      case DioExceptionType.sendTimeout:
        return const Failure('Send timeout.');
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.connectionError:
        if (error.error is SocketException) {
          return const Failure('No internet connection.');
        }
        return const Failure('Connection error.');
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const Failure('No internet connection.');
        }
        return const Failure('Unexpected network error.');
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        return const Failure('incorrect certificate');
    }
  }

  static Failure _handleBadResponse(Response? response) {
    if (response == null) return const Failure('Unknown server error.');
    final code = response.statusCode ?? 0;

    String message;
    switch (code) {
      case 400:
        message = 'Bad request.';
        break;
      case 401:
        message = 'Unauthorized.';
        break;
      case 403:
        message = 'Forbidden.';
        break;
      case 404:
        message = 'Not found.';
        break;
      case 500:
        message = 'Internal server error.';
        break;
      default:
        message = 'Unexpected error. Code: $code';
    }

    return Failure(message, code);
  }
}
class Failure {

  const Failure(this.message, [this.code]);
  final String message;
  final int? code;

  @override
  String toString() => 'Failure(code: $code, message: $message)';
}
