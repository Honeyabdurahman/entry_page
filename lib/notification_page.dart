import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  void _initializeNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
      _showNotificationDialog(message.data);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onResume: $message");
      // Handle when the app is resumed from the background
    });

    // Request notification permissions
    await _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      announcement: false, // Set to false if needed
    );

    // Get the initial notification if the app was launched by tapping a notification
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print("onLaunch: $initialMessage");
      // Handle when the app is launched from a terminated state
      _showNotificationDialog(initialMessage.data);
    }
  }

  void _showNotificationDialog(Map<String, dynamic> message) {
    if (message.containsKey('notification')) {
      final dynamic notification = message['notification'];
      if (notification.containsKey('body')) {
        final dynamic body = notification['body'];
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('New Notification'),
            content: Text(body),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(
        child: Text('Notifications Page Content'),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationsPage(),
    );
  }
}
