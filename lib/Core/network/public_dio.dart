import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PublicDio {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl:dotenv.env['BASE_URL'] ?? "", // change this
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(LogInterceptor(responseBody: true));
}
