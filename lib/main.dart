import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'analytics_services.dart';
import 'todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ফায়ারবেস ইনিশিয়ালাইজ করা
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
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // এই লাইনটি অটোমেটিক স্ক্রিন ট্র্যাক করবে
      navigatorObservers: [AnalyticsService.instance.observer],
      home: const TodoScreen(),
    );
  }
}