import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future NotifSettings() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print("User granted permission : ${settings.authorizationStatus}");
  }

  listenNotif() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Got a message whilst in th foreground!");
      print("Message data: ${message.data}");

      if (message.notification != null) {
        print("Message also contained a notification: ${message.notification}");
      }
    });
  }

  firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }
}
