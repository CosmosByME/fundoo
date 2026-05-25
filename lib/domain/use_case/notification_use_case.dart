import 'package:fundoo/data/models/notification.dart';
import 'package:fundoo/domain/repository/notification_repository_impl.dart';

class NotificationUseCase {
  Future<List<NotificationModel>> getNotifications(int page) async {
    return await NotificationRepositoryImpl().getNotifications(page);
  }

  Future<void> markAsRead(String notificationId) async {
    await NotificationRepositoryImpl().markAsRead(notificationId);
  }
}