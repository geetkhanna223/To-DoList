import 'package:flutter/material.dart';
import 'package:taskmanager/screens/AddTaskScreen.dart';
import 'package:taskmanager/screens/List.dart';


void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TaskListScreen(),
        '/addTask': (context) => AddTaskScreen(),
      },
    );
  }
}

