import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/notification_icon.dart';
import 'package:go_router/go_router.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.game,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [NotificationIcon(hasNotifications: true, onTap: () {
          context.push("/notifications");
        })],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF3E8FF), Color(0xFFE9D5FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                alignment: Alignment.center,
                child: Text("🎮", style: TextStyle(fontSize: 52)),
              ),
              SizedBox(height: 10),
              Text(
                context.l10n.soon,
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                context.l10n.gamesBody,
                style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CustomButton(
                backgroundColor: Color(0xFF7C3AED),
                child: Text(
                  context.l10n.gamesButton,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
