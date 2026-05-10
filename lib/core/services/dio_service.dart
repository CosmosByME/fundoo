import 'package:dio/dio.dart';
import 'package:fundoo/core/services/preferences_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Map<String, dynamic> header = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

Dio dio =
    Dio(BaseOptions(baseUrl: 'https://fundoo.ihma-atm.uz', headers: header))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final accessToken = await PreferencesService.getAccessToken();
            final lang = await PreferencesService.getLocale();
            if (accessToken.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $accessToken';
            }
            options.headers['Accept-Language'] = lang ?? 'uz';
            return handler.next(options);
          },
          onError: (error, handler) async {
            if (error.response?.statusCode == 401) {
              final refreshToken = await PreferencesService.getRefreshToken();
              if (refreshToken != null && refreshToken.isNotEmpty) {
                try {
                  final response = await dio.post(
                    '/api/v1/Auth/token/refresh',
                    data: {'refreshToken': refreshToken},
                  );
                  if (response.statusCode == 200) {
                    final newAccessToken = response.data['data']['accessToken'];
                    final newRefreshToken =
                        response.data['data']['refreshToken'];
                    await PreferencesService.setAccessToken(newAccessToken);
                    await PreferencesService.setRefreshToken(newRefreshToken);
                    error.requestOptions.headers['Authorization'] =
                        'Bearer $newAccessToken';
                    final opts = Options(
                      method: error.requestOptions.method,
                      headers: error.requestOptions.headers,
                    );
                    final cloneReq = await dio.request(
                      error.requestOptions.path,
                      options: opts,
                      data: error.requestOptions.data,
                      queryParameters: error.requestOptions.queryParameters,
                    );
                    return handler.resolve(cloneReq);
                  }
                } catch (e) {
                  return handler.next(error);
                }
              }
            }
            return handler.next(error);
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
