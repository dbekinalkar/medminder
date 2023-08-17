import 'package:flutter/material.dart';
import 'helpers/notification_helper.dart';
import 'screens/add_edit_medicine_screen.dart';
import 'screens/home_screen.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


void main() {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('America/New_York'));  // replace with your preferred time zone
  runApp(const MyApp());
  NotificationHelper.initNotifications();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedMinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add-edit-medicine': (context) => AddEditMedicineScreen(),
      },
    );
  }
}
