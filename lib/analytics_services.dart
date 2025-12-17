import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  // Singleton Pattern
  AnalyticsService._internal();
  static final AnalyticsService instance = AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // স্ক্রিন ট্র্যাকিংয়ের জন্য অবজারভার
  FirebaseAnalyticsObserver get observer => FirebaseAnalyticsObserver(analytics: _analytics);

  // টাস্ক অ্যাড করার ইভেন্ট
  Future<void> logTaskAdded(String taskName) async {
    await _analytics.logEvent(
      name: 'todo_task_created',
      parameters: {
        'content': taskName,
        'platform': 'flutter',
      },
    );
  }

  // টাস্ক ডিলিট করার ইভেন্ট
  Future<void> logTaskDeleted(String taskName) async {
    await _analytics.logEvent(
      name: 'todo_task_removed',
      parameters: {
        'content': taskName,
      },
    );
  }

  // এই মেথডটি আপনার AnalyticsService ক্লাসের ভেতরে যোগ করুন
  Future<void> logSettingChanged(String settingName, bool isEnabled) async {
    await _analytics.logEvent(
      name: 'settings_updated',
      parameters: {
        'setting': settingName,
        'value': isEnabled ? 'enabled' : 'disabled',
      },
    );
  }
}