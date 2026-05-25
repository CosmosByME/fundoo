part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}


class LoadNotifications extends NotificationEvent {}

class MarkNotificationAsRead extends NotificationEvent {
  final String notificationId;

  MarkNotificationAsRead(this.notificationId);
}

class RefreshNotificationsEvent extends NotificationEvent {}