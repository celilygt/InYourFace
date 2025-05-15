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

// Define theme colors
class AppColors {
  // Light Theme
  static const primaryPurple = Color(0xFF4A44C6);
  static const secondaryPurple = Color(0xFF8A84FF);
  static const lightPurple = Color(0xFFE1BEE7);
  static const primaryText = Color(0xFF212121);
  static const secondaryText = Color(0xFF757575);
  static const white = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFFF5F5F5);
  static const successGreen = Color(0xFF4CAF50);
  static const accentBlue = Color(0xFF42A5F5);
  static const warningOrange = Color(0xFFFF9800);
  static const errorRed = Color(0xFFF44336);

  // Dark Theme
  static const darkPrimaryPurple = Color(0xFF6A5CFF);
  static const darkSecondaryPurple = Color(0xFF9D97FF);
  static const darkBackground = Color(0xFF121212);
  static const cardBackground = Color(0xFF242424);
  static const darkDivider = Color(0xFF323232);
  static const darkSuccessGreen = Color(0xFF66BB6A);
  static const darkAccentBlue = Color(0xFF64B5F6);
  static const darkWarningOrange = Color(0xFFFFA726);
  static const darkErrorRed = Color(0xFFEF5350);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InYourFace',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: AppColors.primaryPurple,
          secondary: AppColors.secondaryPurple,
          surface: AppColors.white,
          background: AppColors.lightGrey,
          error: AppColors.errorRed,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
          onSurface: AppColors.primaryText,
          onBackground: AppColors.primaryText,
          onError: AppColors.white,
          brightness: Brightness.light,
        ),
        cardTheme: CardTheme(
          color: AppColors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.lightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primaryPurple, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
          titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryText,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: AppColors.primaryText,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: AppColors.primaryText,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryPurple,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPurple,
            foregroundColor: AppColors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            minimumSize: const Size(64, 48),
            padding: const EdgeInsets.symmetric(horizontal: 24),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.primaryPurple,
          elevation: 4,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
        ),
        scaffoldBackgroundColor: AppColors.lightGrey,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.primaryPurple;
              }
              return Colors.transparent;
            },
          ),
          checkColor: MaterialStateProperty.all(AppColors.white),
          side: BorderSide(color: AppColors.secondaryText),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          primary: AppColors.darkPrimaryPurple,
          secondary: AppColors.darkSecondaryPurple,
          surface: AppColors.cardBackground,
          background: AppColors.darkBackground,
          error: AppColors.darkErrorRed,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
          onSurface: AppColors.white,
          onBackground: AppColors.white,
          onError: AppColors.white,
          brightness: Brightness.dark,
        ),
        cardTheme: CardTheme(
          color: AppColors.cardBackground,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.darkDivider),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.darkPrimaryPurple, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          fillColor: AppColors.cardBackground,
          filled: true,
        ),
        textTheme: TextTheme(
          headlineMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titleLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
          bodyLarge: const TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            color: AppColors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.darkBackground,
          ),
          titleSmall: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.darkSecondaryPurple,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimaryPurple,
            foregroundColor: AppColors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            minimumSize: const Size(64, 48),
            padding: const EdgeInsets.symmetric(horizontal: 24),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: AppColors.darkBackground,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
        ),
        scaffoldBackgroundColor: AppColors.darkBackground,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.darkPrimaryPurple;
              }
              return Colors.transparent;
            },
          ),
          checkColor: MaterialStateProperty.all(AppColors.white),
          side: const BorderSide(color: AppColors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
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
        SnackBar(
          content: Text('You can only have $_maxTasks tasks for now.'),
          backgroundColor: Theme.of(context).colorScheme.error.withOpacity(0.8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.all(16),
        ),
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('InYourFace'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                if (!isDark)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      labelText: 'New Task',
                      hintText: 'What do you need to do?',
                      labelStyle: TextStyle(color: isDark ? AppColors.darkSecondaryPurple : AppColors.secondaryPurple),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: theme.colorScheme.onPrimary),
                    onPressed: _addTask,
                    tooltip: 'Add Task',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  'Your Tasks',
                  style: theme.textTheme.titleLarge,
                ),
                const Spacer(),
                Text(
                  '${_tasks.length}/$_maxTasks',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _tasks.length == _maxTasks 
                        ? (isDark ? AppColors.darkWarningOrange : AppColors.warningOrange)
                        : theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 64,
                          color: theme.colorScheme.primary.withOpacity(0.6),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No tasks yet.',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add some tasks to get started!',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _tasks.length,
                    padding: const EdgeInsets.only(bottom: 24),
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: CheckboxListTile(
                            value: task.isDone,
                            onChanged: (bool? value) {
                              _toggleTaskDone(task.id);
                            },
                            title: Text(
                              task.title,
                              style: TextStyle(
                                fontSize: 16,
                                decoration: task.isDone ? TextDecoration.lineThrough : null,
                                color: task.isDone 
                                    ? theme.colorScheme.onSurface.withOpacity(0.4) 
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                            secondary: IconButton(
                              icon: Icon(
                                Icons.delete_outline, 
                                color: theme.colorScheme.error,
                              ),
                              onPressed: () => _removeTask(task.id),
                              tooltip: 'Delete Task',
                            ),
                            checkboxShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            activeColor: theme.colorScheme.primary,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
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
