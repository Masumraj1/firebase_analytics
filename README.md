# 🚀 Flutter Firebase Analytics – Todo App

This project demonstrates a **complete and professional implementation of Firebase Analytics** in a Flutter application.
It covers **automatic screen tracking**, **custom user events**, **button click analytics**, **user properties**, and **debugging with DebugView**.

The goal is to understand **real user behavior** and make **data-driven decisions**.

---

## 🛠️ Tech Stack

* **Flutter**
* **Firebase Core**
* **Firebase Analytics**
* **Material 3 UI**

---

## 📦 Analytics Features Implemented

✔ Automatic screen tracking
✔ Custom event: Todo task created
✔ Custom event: Todo task deleted
✔ Custom event: Button pressed
✔ Custom event: Settings changed (Dark Mode)
✔ User property: App theme (light / dark)
✔ Funnel-ready event structure
✔ Centralized Analytics Service (Singleton pattern)

---

## 🔑 Firebase Setup (Step-by-Step)

### 1️⃣ Create Firebase Project

1. Go to 👉 [https://console.firebase.google.com](https://console.firebase.google.com)
2. Click **Add Project**
3. Complete project creation
4. Enable **Google Analytics** when prompted

---

### 2️⃣ Register App (Android example)

1. Add Android app in Firebase Console
2. Provide package name
3. Download `google-services.json`
4. Place it in:

```
android/app/google-services.json
```

---

### 3️⃣ Install Required Packages

```bash
flutter pub add firebase_core firebase_analytics
```

---

### 4️⃣ Firebase Initialization

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
```

---

## 📊 Analytics Service (Best Practice Architecture)

All analytics logic is handled in **one central service** to keep UI clean and scalable.

```dart
class AnalyticsService {
  AnalyticsService._internal();
  static final AnalyticsService instance = AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);
}
```

### ✅ Why this approach?

✔ Single source of truth
✔ Easy to maintain
✔ Reusable across the app
✔ Production-ready pattern

---

## 🧭 Automatic Screen Tracking

Enable automatic screen tracking globally:

```dart
MaterialApp(
  navigatorObservers: [
    AnalyticsService.instance.observer,
  ],
);
```

Manually assign screen names during navigation:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const SettingsScreen(),
    settings: const RouteSettings(name: 'SettingsScreen'),
  ),
);
```

📍 Firebase Console:

```
Analytics → Screens & pages
```

---

## 🎯 Custom Event Tracking

### 🟢 Task Created

```dart
AnalyticsService.instance.logTaskAdded(taskName);
```

### 🔴 Task Deleted

```dart
AnalyticsService.instance.logTaskDeleted(taskName);
```

### 🔘 Button Pressed

```dart
AnalyticsService.instance.logButtonPress('add_task_button');
```

### ⚙️ Settings Changed

```dart
AnalyticsService.instance.logSettingChanged('dark_mode', isEnabled);
```

📍 Firebase Console:

```
Analytics → Events
```

---

## 👤 User Properties (User Segmentation)

Used to categorize users for analysis.

```dart
analytics.setUserProperty(
  name: 'theme',
  value: 'dark',
);
```

Examples:

* Dark mode users
* Feature-active users

📍 Firebase Console:

```
Analytics → Audiences
```

---

## 🧪 Debug & Realtime Testing

### 🔹 Android DebugView

```bash
adb shell setprop debug.firebase.analytics.app com.example.firebase_analytics_app
```

### 🔹 iOS / Flutter

```bash
flutter run --debug
```

📍 Firebase Console:

```
Analytics → DebugView
```

---

## 📈 Funnel & User Journey (Ready)

Tracked events allow creating funnels like:

```
App Open → Todo Screen → Add Task → Settings → Dark Mode ON
```

📍 Firebase Console:

```
Analytics → Funnels
```

---

## 🏗️ Project Structure

```
lib/
 ├── analytics_services.dart
 ├── main.dart
 ├── todo_screen.dart
 └── setting_screen.dart
```

---

## ✅ Best Practices Followed

✔ Centralized analytics logic
✔ No Firebase code inside UI widgets
✔ Scalable event naming
✔ Interview-ready architecture
✔ Production-grade structure

---

## 📌 Conclusion

This project is a **complete, real-world example** of Firebase Analytics in Flutter.
Perfect for:

* Production apps
* Learning analytics
* Interviews
* Startup MVPs

---

### 👨‍💻 Author

**Flutter Developer**
Built with ❤️ using Flutter & Firebase
