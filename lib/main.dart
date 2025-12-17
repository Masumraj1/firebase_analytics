import 'package:firebase_analytics_app/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'analytics_services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Professional Todo Analytics',
      // প্রফেশনাল স্ক্রিন ট্র্যাকিং
      navigatorObservers: [AnalyticsService.instance.observer],
      home: const TodoScreen(),
    );
  }
}