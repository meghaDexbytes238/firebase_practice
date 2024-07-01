import 'package:firebase_messaging/firebase_messaging.dart';
class PushNotificationService {
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> backgroundHandler(RemoteMessage message) async {
    print('Handling a background message ${message.messageId}');
  }
  Future<String?> getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    String? token = await _fcm.getToken();
    print('Token: $token');
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });



}
  Future initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    // Get the token
    await getToken();
  }
}
