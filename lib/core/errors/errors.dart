import 'package:dio/dio.dart';

abstract class Errors {
  final String errorMessage;

  Errors({required this.errorMessage});
}

class ServerError extends Errors {
  ServerError({required super.errorMessage});

  static ServerError fromDioError(DioException exceptions) {
    switch (exceptions.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(errorMessage: "Connection time out");
      case DioExceptionType.sendTimeout:
        return ServerError(errorMessage: "Send time out");
      case DioExceptionType.receiveTimeout:
        return ServerError(errorMessage: "Receive time out");
      case DioExceptionType.badCertificate:
        return ServerError(errorMessage: "Bad certificate");
      case DioExceptionType.badResponse:
        return ServerError.badResponseError(
            exceptions.response!.statusCode, exceptions.response!.data);
      case DioExceptionType.cancel:
        return ServerError(errorMessage: "Request canceled");
      case DioExceptionType.connectionError:
        return ServerError(errorMessage: "Connection error");
      case DioExceptionType.unknown:
        if (exceptions.message!.contains("SocketException")) {
          return ServerError(errorMessage: "No internet connection");
        } else {
          return ServerError(
              errorMessage: "UnExpected error , please try again later ...");
        }
      default:
        return ServerError(errorMessage: "Something went wrong");
    }
  }

  static ServerError badResponseError(int? statusCode, String response) {
    switch (statusCode) {
      case 400:
        return ServerError(errorMessage: response);
      case 401:
        return ServerError(errorMessage: response);
      case 403:
        return ServerError(errorMessage: response);
      case 404:
        return ServerError(
            errorMessage: "Requested not found , please try again later ...");
      case 500:
        return ServerError(
            errorMessage: "Server error , please try again later ...");
      default:
        return ServerError(errorMessage: "Something went wrong");
    }
  }
}
