import 'package:dio/dio.dart';
import 'package:fundoo/core/toasts/error_toast.dart';

import '../../core/services/dio_service.dart';
import '../../data/models/notification.dart';
import '../../data/repository/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {

  @override
  Future<List<NotificationModel>> getNotifications(int page) async {
    try {
      final response = await dio.get("/api/v1/Notifications", queryParameters: {"pageSize": 20, "page": page, "isRead": false});
      if (response.statusCode == 200) {
        List data = response.data["data"]["items"] as List;
        return data.map((json) => NotificationModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load notifications for page $page");
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      showErrorToast(message);
      throw Exception(message);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    try {
      final response = await dio.put("/api/v1/Notifications/$notificationId/read");
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("Failed to mark notification as read");
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      showErrorToast(message);
      throw Exception(message);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}