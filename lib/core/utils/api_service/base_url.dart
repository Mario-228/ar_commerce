import 'package:dio/dio.dart';

abstract class BaseUrl {
  static const String authenticationBaseUrl =
      "https://concise-ant-sound.ngrok-free.app/api/";
  static const String productBaseUrl =
      "https://rational-deep-dinosaur.ngrok-free.app/api/";
  static final Dio products = Dio(
    BaseOptions(
      baseUrl: productBaseUrl,
      receiveDataWhenStatusError: true,
    ),
  );
  static final Dio authentication = Dio(
    BaseOptions(
      baseUrl: authenticationBaseUrl,
      receiveDataWhenStatusError: true,
    ),
  );
}
