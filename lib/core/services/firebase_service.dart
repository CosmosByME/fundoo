import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fundoo/core/services/preferences_service.dart';
import 'package:fundoo/core/toasts/error_toast.dart';

import '../../firebase_options.dart';

class FireBaseService {
  late FirebaseMessaging messaging;

  Future<void> initialize() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
    );

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await initializeMessage();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("Foreground notification received");

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          id: 1,
        );
      }
    });
  }

  Future<void> initializeMessage() async {
    messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();

    try {
      final token = await messaging.getToken();
      await PreferencesService.setFcpToken(token!);
      debugPrint("FCM Token: $token");
    } on Exception {
      showErrorToast("Failed to get FCM token");
    }
  }
}
