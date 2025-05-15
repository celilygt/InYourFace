import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_widget/home_widget.dart';
import 'task_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

const String appGroupId = 'group.celilygt.in_your_face';
const String androidWidgetName = 'VisibleTasksWidgetProvider'; 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InYourFace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const TaskScreen(),
    );
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  List<Task> _tasks = [];
  final int _maxTasks = 3; // Limit tasks for MVP

  @override
  void initState() {
    super.initState();
    _loadTasks();
    HomeWidget.setAppGroupId(appGroupId);
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      final List<dynamic> taskJson = jsonDecode(tasksString);
      setState(() {
        _tasks = taskJson.map((json) => Task.fromJson(json)).toList();
      });
    }
    _updateWidget();
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String tasksString = jsonEncode(_tasks.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', tasksString);
    _updateWidget();
  }

  void _addTask() {
    if (_taskController.text.isNotEmpty && _tasks.length < _maxTasks) {
      final newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(1000).toString(),
        title: _taskController.text,
      );
      setState(() {
        _tasks.add(newTask);
      });
      _taskController.clear();
      _saveTasks();
    } else if (_tasks.length >= _maxTasks) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You can only have $_maxTasks tasks for now.')),
      );
    }
  }

  void _toggleTaskDone(String id) {
    setState(() {
      final taskIndex = _tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        _tasks[taskIndex].isDone = !_tasks[taskIndex].isDone;
      }
    });
    _saveTasks();
  }

  void _removeTask(String id) {
    setState(() {
      _tasks.removeWhere((task) => task.id == id);
    });
    _saveTasks();
  }

  Future<void> _updateWidget() async {
    // For MVP, let's just pass the first few task titles
    await HomeWidget.saveWidgetData<String>('task_1_title', _tasks.isNotEmpty ? _tasks[0].title : "");
    await HomeWidget.saveWidgetData<bool>('task_1_done', _tasks.isNotEmpty ? _tasks[0].isDone : false);

    await HomeWidget.saveWidgetData<String>('task_2_title', _tasks.length > 1 ? _tasks[1].title : "");
    await HomeWidget.saveWidgetData<bool>('task_2_done', _tasks.length > 1 ? _tasks[1].isDone : false);

    await HomeWidget.saveWidgetData<String>('task_3_title', _tasks.length > 2 ? _tasks[2].title : "");
    await HomeWidget.saveWidgetData<bool>('task_3_done', _tasks.length > 2 ? _tasks[2].isDone : false);
    
    // This tells the native side to redraw the widget
    HomeWidget.updateWidget(
      name: androidWidgetName,
      androidName: androidWidgetName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InYourFace'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'New Task (Max $_maxTasks)',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ),
              onSubmitted: (_) => _addTask(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (bool? value) {
                      _toggleTaskDone(task.id);
                    },
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                    onPressed: () => _removeTask(task.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
