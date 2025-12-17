import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'analytics_services.dart';
import 'todo_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  try {
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  } catch(e) {
    print("Failed to initialize Firebase: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Analytics App',
      navigatorObservers: [
        AnalyticsService.instance.observer, // ✅ Screen tracking
      ],
      home: const TodoScreen(),
    );
  }
}
