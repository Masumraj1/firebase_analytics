# 🚀 Flutter Firebase Analytics – Todo App

This project demonstrates a **professional implementation of Firebase Analytics** in a Flutter application.
The app tracks **screen views** and **custom user events** such as creating/deleting tasks and changing settings.

---

## 🛠️ Tech Stack

* **Flutter**
* **Firebase Core**
* **Firebase Analytics**
* **Material 3 UI**

---

## 📦 Features Tracked with Firebase Analytics

✔ Automatic screen tracking
✔ Custom event: Todo task created
✔ Custom event: Todo task deleted
✔ Custom event: Settings changed (Dark Mode)
✔ Clean architecture using Analytics Service (Singleton pattern)

---

## 🔑 Firebase Setup (Step-by-Step)

### 1️⃣ Create Firebase Project

1. Go to 👉 [https://console.firebase.google.com](https://console.firebase.google.com)
2. Click **Add Project**
3. Give a project name and complete setup
4. Enable **Google Analytics** when prompted

---

### 2️⃣ Add Firebase App

#### For Android

1. Register Android app
2. Add package name (e.g. `com.example.firebase_analytics_app`)
3. Download `google-services.json`
4. Place it inside:

```
android/app/google-services.json
```

---

### 3️⃣ Install Required Packages

Run the following command:

```bash
flutter pub add firebase_core firebase_analytics
```

---

### 4️⃣ Firebase Initialization

Initialize Firebase before running the app:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
```

---

## 📊 Analytics Service (Best Practice)

All analytics logic is handled in **one central service**:

```dart
class AnalyticsService {
  AnalyticsService._internal();
  static final AnalyticsService instance = AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);
}
```

✔ Easy to maintain
✔ Reusable
✔ Professional architecture

---

## 🧭 Automatic Screen Tracking

Enable screen tracking globally:

```dart
MaterialApp(
  navigatorObservers: [
    AnalyticsService.instance.observer,
  ],
);
```

Add screen name manually when navigating:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const SettingsScreen(),
    settings: const RouteSettings(name: 'SettingsScreen'),
  ),
);
```

---

## 🎯 Custom Events Tracking

### 🟢 Task Added

```dart
AnalyticsService.instance.logTaskAdded(taskName);
```

### 🔴 Task Deleted

```dart
AnalyticsService.instance.logTaskDeleted(taskName);
```

### ⚙️ Settings Changed

```dart
AnalyticsService.instance.logSettingChanged('dark_mode', isEnabled);
```

---

## 📈 View Analytics Data

1. Go to **Firebase Console**
2. Select your project
3. Navigate to:

```
Analytics → Events
Analytics → DebugView (for real-time testing)
```

---

## 🧪 Debug Mode (Optional but Recommended)

### Android

```bash
adb shell setprop debug.firebase.analytics.app com.example.firebase_analytics_app
```

### iOS

Run app with:

```bash
flutter run --debug
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

✔ Singleton pattern for analytics
✔ Clean separation of concerns
✔ No analytics code inside UI logic
✔ Scalable for large applications

---

## 📌 Conclusion

This project is a **production-ready example** of Firebase Analytics integration in Flutter.
It is suitable for **real apps**, **interviews**, and **professional projects**.

---

### 👨‍💻 Author

**Flutter Developer**
Built with ❤️ using Flutter & Firebase
