import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  AnalyticsService._internal();
  static final AnalyticsService instance = AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Screen observer
  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  /// ---------- USER ----------
  Future<void> setUser(String userId) async {
    await _analytics.setUserId(id: userId);
  }

  Future<void> setUserTheme(bool isDark) async {
    await _analytics.setUserProperty(
      name: 'theme',
      value: isDark ? 'dark' : 'light',
    );
  }

  /// ---------- EVENTS ----------
  Future<void> logAddTask(String taskName) async {
    await _analytics.logEvent(
      name: 'task_added',
      parameters: {
        'task_name': taskName,
      },
    );
  }

  Future<void> logDeleteTask(String taskName) async {
    await _analytics.logEvent(
      name: 'task_deleted',
      parameters: {
        'task_name': taskName,
      },
    );
  }

  Future<void> logButtonPress(String buttonName) async {
    await _analytics.logEvent(
      name: 'button_pressed',
      parameters: {
        'button': buttonName,
      },
    );
  }

  Future<void> logSettingsChanged(String setting, bool value) async {
    await _analytics.logEvent(
      name: 'settings_changed',
      parameters: {
        'setting': setting,
        'value': value ? 'on' : 'off',
      },
    );
  }
}
