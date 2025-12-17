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

  void _handleAddTask() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() => _tasks.add(text));

      // অ্যানালিটিক্স সার্ভিস কল করা
      AnalyticsService.instance.logTaskAdded(text);

      _controller.clear();
      FocusScope.of(context).unfocus(); // কী-বোর্ড বন্ধ করার জন্য
    }
  }

  void _handleDeleteTask(int index) {
    final removedTask = _tasks[index];
    setState(() => _tasks.removeAt(index));

    // অ্যানালিটিক্স সার্ভিস কল করা
    AnalyticsService.instance.logTaskDeleted(removedTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TodoScreen এর AppBar অংশটি এভাবে পরিবর্তন করুন:
      appBar: AppBar(
        title: const Text('Pro Todo Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                  // এই নামটি Firebase ড্যাশবোর্ডে "Screen View" হিসেবে দেখাবে
                  settings: const RouteSettings(name: 'SettingsScreen'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildInputArea(),
          const Divider(),
          Expanded(child: _buildTaskList()),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter task name...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _handleAddTask(),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: _handleAddTask,
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    if (_tasks.isEmpty) {
      return const Center(child: Text('No tasks yet! Add some.'));
    }
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          title: Text(_tasks[index]),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () => _handleDeleteTask(index),
          ),
        ),
      ),
    );
  }
}