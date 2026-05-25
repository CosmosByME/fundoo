import 'package:dio/dio.dart';
import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/core/toasts/error_toast.dart';

class FcpTokenRegisterRepositoryImpl {
  Future<void> setFcpToken(String token) async {
    try {
      await dio.put("/api/v1/User/me/device-token", data: {"fcmToken": token});
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      showErrorToast(message);
      throw Exception(message);
    }
  }


  Future<void> removeFcpToken() async {
    try {
    await dio.delete("/api/v1/User/me/device-token");
    } on DioException catch (e) {
    final data = e.response?.data;
    final message =
    data?['error']?['message'] ??
    data?['detail'] ??
    e.message ??
    'Unknown error';
    showErrorToast(message);
    throw Exception(message);
    }
  }
}