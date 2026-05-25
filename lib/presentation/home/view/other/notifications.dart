import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/data/models/notification.dart';

import '../../bloc/notification_bloc/notification_bloc.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 200 &&
          !context.read<NotificationBloc>().state.isLoading &&
          context.read<NotificationBloc>().state.isScrollable) {
        context.read<NotificationBloc>().add(LoadNotifications());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.l10n.notifications,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            actionsPadding: EdgeInsets.only(right: 20),
          ),
          body: state.notifications == null || state.notifications!.isEmpty
              ? Center(
                  child: Text(
                    context.l10n.noNotifications,
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                  ),
                )
              : ListView.builder(
                  controller: controller,
                  itemCount:
                      state.notifications!.length + (state.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < state.notifications!.length) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          context.read<NotificationBloc>().add(
                            MarkNotificationAsRead(
                              state.notifications![index].id,
                            ),
                          );
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        child: NotificationTile(
                          notification: state.notifications![index],
                        ),
                      );
                    } else if (index == state.notifications!.length &&
                        state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
        );
      },
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF3E8FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFE9D5FF),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text("🔔", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  notification.body,
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                ),
                SizedBox(height: 4),
                Text(
                  "${notification.createdAt.day}.${notification.createdAt.month}.${notification.createdAt.year} ${notification.createdAt.hour}:${notification.createdAt.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
