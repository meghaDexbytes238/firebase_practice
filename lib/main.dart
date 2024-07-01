import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'notification.dart';
//final _messageStreamController = BehaviorSubject<RemoteMessage>();
//bool shouldUseFirebaseEmulator = false;
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }
//final messaging = FirebaseMessaging.instance;

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseMessaging messing = FirebaseMessaging.instance;
//FirebaseMessaging messaging = FirebaseMessaging.instance;

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print('Handling a background message ${message.messageId}');
// }
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

@override
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationSettings settings =   await messing.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    print('token : t$token');
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    String? token = await messaging.getToken();
    print('Token: $token');
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
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
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp( MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //   print('Got a message whilst in the foreground!');
//   //   print('Message data: ${message.data}');
//   //   // if (message.notification != null) {
//   //   //   print('Message also contained a notification: ${message.notification}');
//   //   // }
//   // });
//   // await FirebaseMessaging.instance.setAutoInitEnabled(true);
//   // Future initialize() async {
//   //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //     print('Got a message whilst in the foreground!');
//   //     print('Message data: ${message.data}');
//   //
//   //     if (message.notification != null) {
//   //       print('Message also contained a notification: ${message.notification}');
//   //     }
//   //   });
//   //
//   //   FirebaseMessaging.onBackgroundMessage(backgroundHandler);
//   //
//   //   // Get the token
//   //   await getToken();
//   // }
//   // FirebaseMessaging.instance.getToken().then((value) async {
//   //   String? token = value;
//   //   print("tokenmy : $token");
//   //
//   //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //     print('Got a message whilst in the foreground!');
//   //     print('Message data: ${message.data}');
//   //
//   //     if (message.notification != null) {
//   //       print('Message also contained a notification: ${message.notification}');
//   //     }
//   //   });
//   //   await Firebase.initializeApp();
//     //NotificationSettings settings = await messaging.getNotificationSettings();
//
//     //FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//     // NotificationSettings settings = await messaging.requestPermission(
//     //   alert: true,
//     //   announcement: false,
//     //   badge: true,
//     //   carPlay: false,
//     //   criticalAlert: false,
//     //   provisional: false,
//     //   sound: true,
//     // );
//
//     // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     //   print('User granted permission');
//     // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//     //   print('User granted provisional permission');
//     // } else {
//     //   print('User declined or has not accepted permission');
//     // }
//     // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     //   alert: true, // Required to display a heads up notification
//     //   badge: true,
//     //   sound: true,
//     // );
//     // onMessage: (Map<String, dynamic> message) async {
//       //   print('on message $message');
//       //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       //     RemoteNotification? notification = message.notification;
//       //     print('Got a message whilst in the foreground!');
//       //     print('Message data: ${message.data}');
//       //     if (message.notification != null) {
//       //       print('Message also contained a notification: ${message.notification}');
//       //     }
//       //   });
//       // },
//       // onResume: (Map<String, dynamic> message) async {
//       //   print('on resume $message');
//       //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       //     RemoteNotification? notification = message.notification;
//       //     print('Got a message whilst in the foreground!');
//       //     print('Message data: ${message.data}');
//       //     if (message.notification != null) {
//       //       print('Message also contained a notification: ${message.notification}');
//       //     }
//       //   });
//       // }
//       // onLaunch: (Map<String, dynamic> message) async {
//       //   print('on launch $message');
//       //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       //     RemoteNotification? notification = message.notification;
//       //     print('Got a message whilst in the foreground!');
//       //     print('Message data: ${message.data}');
//       //     if (message.notification != null) {
//       //       print('Message also contained a notification: ${message.notification}');
//       //     }
//       //   });
//       // },
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     //   RemoteNotification? notification = message.notification;
//     //   print('Got a message whilst in the foreground!');
//     //   print('Message data: ${message.data}');
//     //   if (message.notification != null) {
//     //     print('Message also contained a notification: ${message.notification}');
//     //   }
//     // });
//
//     // NotificationSettings settings = await messaging.requestPermission(
//     //   alert: true,
//     //   announcement: false,
//     //   badge: true,
//     //   carPlay: false,
//     //   criticalAlert: false,
//     //   provisional: false,
//     //   sound: true,
//     // );
//   //print('User granted permission: ${settings.authorizationStatus}');
//   //
//   //   NotificationSettings settings = await messaging.requestPermission(
//   //     alert: true,
//   //     announcement: false,
//   //     badge: true,
//   //     carPlay: false,
//   //     criticalAlert: false,
//   //     provisional: false,
//   //     sound: true,
//   //   );
//   //   print('User granted permission: ${settings.authorizationStatus}');
//   //FirebaseMessaging.onBackgroundMessage(backgroundHandler);
//   runApp( MyApp());
// }

class MyApp extends StatelessWidget {
   MyApp({super.key});
 // final PushNotificationService _notificationService = PushNotificationService();
   final PushNotificationService _notificationService = PushNotificationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginFormScreen(),
    );
  }
}


