import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udevs_todo/data/local_data/local_data.dart';
import 'app/app.dart';
import 'data/services/notification/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing Hive && Storage Service
  await LocalData.getInstance();

  // Setting portrait view on app && white status bar
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initializing notification service
  LocalNotificationService.localNotificationService.init();

  runApp(App());
}
