import 'package:flutter/material.dart';

import 'analytics_services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SwitchListTile(
        title: const Text('Dark Mode'),
        value: _darkMode,
        onChanged: (value) {
          setState(() => _darkMode = value);

          AnalyticsService.instance.setUserTheme(value);
          AnalyticsService.instance.logSettingsChanged('dark_mode', value);
        },
      ),
    );
  }
}
