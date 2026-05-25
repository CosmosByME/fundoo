import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundoo/domain/use_case/notification_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/notification.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    on<LoadNotifications>(_loadNotifications);
    on<RefreshNotificationsEvent>(refreshNotifications);
    on<MarkNotificationAsRead>(_markAsRead);
  }

  void _loadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    if (!state.isScrollable) return;
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      // Simulate fetching notifications from an API or database
      final newNotifications = await NotificationUseCase().getNotifications(
        state.page,
      );
      emit(
        state.copyWith(
          notifications: [...?state.notifications, ...newNotifications],
          isScrollable: newNotifications.isNotEmpty,
          isLoading: false,
          page: state.page + 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString().replaceFirst("Exception: ", ''),
        ),
      );
    }
  }

  void refreshNotifications(
    RefreshNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(
      state.copyWith(
        isScrollable: true,
        errorMessage: null,
        page: 1,
        notifications: [],
      ),
    );
  }

  void _markAsRead(
    MarkNotificationAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await NotificationUseCase().markAsRead(event.notificationId);
      final index = state.notifications?.indexWhere((n) => n.id == event.notificationId);
      if (index == null || index == -1) return;
      final updatedNotifications = List<NotificationModel>.from(state.notifications!);
      updatedNotifications.removeAt(index);
      emit(state.copyWith(notifications: updatedNotifications));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString().replaceFirst("Exception: ", ''),
        ),
      );
    }
  }
}
