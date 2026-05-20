import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final token = await _fcm.getToken();
    if (token != null) {
      // TODO: Send token to backend
    }

    FirebaseMessaging.onMessage.listen((message) {
      // Notification is displayed by OS via FCM data payload
    });
  }
}
