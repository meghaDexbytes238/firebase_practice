import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authentication.dart';
import 'notification.dart';
class LoginFormScreen extends StatefulWidget {
   LoginFormScreen({super.key});
  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}
class _LoginFormScreenState extends State<LoginFormScreen> with WidgetsBindingObserver {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if(googleUser != null){
        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
        final AuthCredential Crediential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await _firebaseAuth.signInWithCredential(Crediential);
      }
    } on Exception catch (e) {
      print('exception->$e');
    }
  }
  PushNotificationService notification = PushNotificationService();
  //@override
  // void initState() {
  //   notification.getToken();
  //   notification.initialize();
  //   notification.backgroundHandler(notification as RemoteMessage);
  //   super.initState();
  // }
  // void initState() {
  //   super.initState();
  //  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  //  //  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
  //  //  _firebaseMessaging.getToken().then((token){
  //  //    print("token is $token");
  //  //
  //  //  });// Change here
  //   // _firebaseMessaging.getToken().then((token){
  //   //   print("token is $token");
  //   // });
  //   // notification.getDeviceToken().then((value) {
  //   //   print("token other:  $value");
  //   // });
  //   WidgetsBinding.instance.addObserver(this);
  // }
  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  // switch(state){
  //   case AppLifecycleState.inactive :
  //     print('inactive');
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //           RemoteNotification? notification = message.notification;
  //           print('Got a message whilst in the foreground!');
  //           print('Message data: ${message.data}');
  //           if (message.notification != null) {
  //             print('Message also contained a notification: ${message.notification}');
  //           }
  //         });
  //
  //     break;
  //   case AppLifecycleState.resumed :
  //     print('resumed');
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       RemoteNotification? notification = message.notification;
  //       print('Got a message whilst in the foreground!');
  //       print('Message data: ${message.data}');
  //       if (message.notification != null) {
  //         print('Message also contained a notification: ${message.notification}');
  //       }
  //     });
  //     break;
  //   case AppLifecycleState.paused :
  //     print('paused');
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       RemoteNotification? notification = message.notification;
  //       print('Got a message whilst in the foreground!');
  //       print('Message data: ${message.data}');
  //       if (message.notification != null) {
  //         print('Message also contained a notification: ${message.notification}');
  //       }
  //     });
  //     break;
  //   case AppLifecycleState.detached:
  //     print('detached');
  //     break;
  //   case AppLifecycleState.hidden:
  //     print('hidden');
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       RemoteNotification? notification = message.notification;
  //       print('Got a message whilst in the foreground!');
  //       print('Message data: ${message.data}');
  //       if (message.notification != null) {
  //         print('Message also contained a notification: ${message.notification}');
  //       }
  //     });
  //
  //     break;
  // }
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(),
              hintText: 'email'
          ),),
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(),hintText: 'password'),
          ),
          ElevatedButton(
            onPressed: () async {
              signInWithGoogle();
            },
            child: const Text('Sing with google'),
          )
        ],
        ),
      ),
    );
  }
}
