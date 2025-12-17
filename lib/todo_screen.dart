import 'package:firebase_analytics_app/setting_screen.dart';
import 'package:flutter/material.dart';

import 'analytics_services.dart';


class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() => _tasks.add(text));

    AnalyticsService.instance.logAddTask(text);
    AnalyticsService.instance.logButtonPress('add_task');

    _controller.clear();
  }

  void _deleteTask(int index) {
    final task = _tasks[index];
    setState(() => _tasks.removeAt(index));

    AnalyticsService.instance.logDeleteTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsScreen(),
                  settings: const RouteSettings(name: 'SettingsScreen'),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter task',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(_tasks[i]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteTask(i),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
