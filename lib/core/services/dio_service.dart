import 'package:dio/dio.dart';
import 'package:fundoo/core/services/preferences_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Map<String, dynamic> header = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};

Dio dio =
    Dio(BaseOptions(baseUrl: 'https://fundoo.ihma-atm.uz', headers: header))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final accessToken = await PreferencesService.getAccessToken();
            if (accessToken.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $accessToken';
            }
            return handler.next(options);
          },
        ),
      )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
