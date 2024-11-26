import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'soom.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeNotifications();
  runApp(const MyApp());
}

Future<void> _initializeNotifications() async {
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings iosInitializationSettings =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SoomPage(),
    );
  }
}
