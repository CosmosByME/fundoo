import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final void Function() onTap;
  final bool? hasNotifications;
  const NotificationIcon({super.key, this.hasNotifications, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Center(
              child: Text("🔔", style: TextStyle(fontSize: 20)),
            ),
            if (hasNotifications == true)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xFFEF4444),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}