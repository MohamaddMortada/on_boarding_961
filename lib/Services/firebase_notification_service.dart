import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initializeFirebaseMessaging() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print("Notification permission: ${settings.authorizationStatus}");

    String? token = await messaging.getToken();
    print("FCM Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.title}");
      _showLocalNotification(message);
    });
  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id', 'channel_name', importance: Importance.high, priority: Priority.high);
    const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0, 
      message.notification?.title,
      message.notification?.body,
      platformDetails,
      payload: message.data.toString(),
    );
  }
}
