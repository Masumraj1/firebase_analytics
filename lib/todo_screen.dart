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

      // সার্ভিস কল করা
      AnalyticsService.instance.logTaskAdded(text);

      _controller.clear();
    }
  }

  void _handleDeleteTask(int index) {
    final removedTask = _tasks[index];
    setState(() => _tasks.removeAt(index));

    // সার্ভিস কল করা
    AnalyticsService.instance.logTaskDeleted(removedTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pro Analytics Todo')),
      body: Column(
        children: [
          _buildInputArea(),
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
          Expanded(child: TextField(controller: _controller)),
          const SizedBox(width: 8),
          ElevatedButton(onPressed: _handleAddTask, child: const Icon(Icons.add)),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(_tasks[index]),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: () => _handleDeleteTask(index),
        ),
      ),
    );
  }
}