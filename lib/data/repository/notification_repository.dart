import 'package:fundoo/data/models/notification.dart';

abstract class NotificationRepository {
  Future<List<NotificationModel>> getNotifications(int page);
  Future<void> markAsRead(String notificationId);
}