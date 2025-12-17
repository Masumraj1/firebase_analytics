import 'package:flutter/material.dart';
import 'analytics_services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Toggle app theme'),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });

              // কাস্টম ইভেন্ট ট্র্যাক করা: ইউজার সেটিংস চেঞ্জ করেছে
              // এখানে আমরা সরাসরি logEvent এর বদলে একটি জেনেরিক মেথড ব্যবহার করতে পারি
              // অথবা সার্ভিস ফাইলে সরাসরি পাঠাতে পারি।
              AnalyticsService.instance.logSettingChanged('dark_mode', value);
            },
          ),
          const ListTile(
            title: Text('App Version'),
            trailing: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}