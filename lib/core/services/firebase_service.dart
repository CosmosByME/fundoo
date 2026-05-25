import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
      print("Foreground notification received");

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
      debugPrint("Firebase Messaging Token: $token");
    } on Exception catch (e) {
      debugPrint("Error getting Firebase Messaging token: $e");
    }
  }
}
