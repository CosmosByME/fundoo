part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<NotificationModel>? notifications;
  final int page;
  final bool isScrollable;

  const NotificationState({
    this.isLoading = false,
    this.errorMessage,
    this.notifications,
    this.page = 1,
    this.isScrollable = true,
  });

  NotificationState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<NotificationModel>? notifications,
    int? page,
    bool? isScrollable,
  }) {
    return NotificationState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      notifications: notifications ?? this.notifications,
      page: page ?? this.page,
      isScrollable: isScrollable ?? this.isScrollable,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    notifications,
    page,
    isScrollable,
  ];
}
