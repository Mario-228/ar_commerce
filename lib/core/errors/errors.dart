import 'dart:io';

import 'package:dio/dio.dart';

abstract class Errors {
  final String errorMessage;

  Errors({required this.errorMessage});
}

class ServerError extends Errors {
  ServerError({required super.errorMessage});

  static ServerError fromDioError(dynamic error) {
    if (error is DioException) {
      return _fromDioError(error);
    } else if (error is FormatException) {
      return ServerError(errorMessage: "Data format error. Please try again.");
    } else if (error is SocketException) {
      return ServerError(errorMessage: "No internet connection.");
    } else {
      return ServerError(
          errorMessage: "An unexpected error occurred. Please try again.");
    }
  }

  static ServerError _fromDioError(DioException exceptions) {
    switch (exceptions.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(
            errorMessage: "Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        return ServerError(errorMessage: "Send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        return ServerError(errorMessage: "Receive timeout. Please try again.");
      case DioExceptionType.badCertificate:
        return ServerError(errorMessage: "Invalid server certificate.");
      case DioExceptionType.badResponse:
        return _handleBadResponse(
            exceptions.response?.statusCode, exceptions.response?.data);
      case DioExceptionType.cancel:
        return ServerError(errorMessage: "Request was cancelled.");
      case DioExceptionType.connectionError:
        return ServerError(errorMessage: "Network connection error.");
      case DioExceptionType.unknown:
      default:
        if (exceptions.message != null &&
            exceptions.message!.contains("SocketException")) {
          return ServerError(errorMessage: "No internet connection.");
        } else {
          return ServerError(
              errorMessage: "Unexpected error. Please try again later.");
        }
    }
  }

  static ServerError _handleBadResponse(int? statusCode, dynamic data) {
    String errorMessage = "Something went wrong. Please try again.";

    if (data is Map<String, dynamic>) {
      errorMessage = data['message'] ??
          data['error'] ??
          data['errors']?.toString() ??
          errorMessage;
    } else if (data is String) {
      errorMessage = data;
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerError(errorMessage: errorMessage);
      case 404:
        return ServerError(
            errorMessage: "Resource not found. Please try later.");
      case 500:
      case 502:
      case 503:
      case 504:
        return ServerError(
            errorMessage: "Server error. Please try again later.");
      default:
        return ServerError(errorMessage: errorMessage);
    }
  }
}
