import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              int id = Random().nextInt(10000);
              AndroidNotificationDetails androidNotificationDetails =
                  const AndroidNotificationDetails(
                      "Local Notification", "Local Notification",
                      importance: Importance.max,
                      priority: Priority.max,
                      onlyAlertOnce: true,
                      enableVibration: true,
                      playSound: true);
              DarwinNotificationDetails darwinNotificationDetails =
                  const DarwinNotificationDetails();
              NotificationDetails notificationDetails = NotificationDetails(
                  android: androidNotificationDetails,
                  iOS: darwinNotificationDetails);
              await flutterLocalNotificationsPlugin.show(id, "Hello everyone",
                  "I am a notification", notificationDetails);
            },
            child: const Text("Send Notification")),
      ),
    );
  }
}
