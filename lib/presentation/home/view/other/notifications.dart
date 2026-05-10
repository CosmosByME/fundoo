import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Widget> notifications = [Notification(), Notification(), Notification()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.notifications,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        actionsPadding: EdgeInsets.only(right: 20),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                context.l10n.noNotifications,
                style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      notifications.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: notifications[index],
                );
              },
            ),
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({super.key});

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
                  "Oylik maqsad eslatmasi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "Bu oy 800 000 so'm tejashingiz kerak.",
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                ),
                SizedBox(height: 4),
                Text(
                  "12.01.2026, 10:00",
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
