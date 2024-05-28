import 'package:flutter/material.dart';
import 'package:taskmanager/model/task.dart';
import 'package:taskmanager/screens/AddTaskScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Manager',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Color.fromARGB(255, 223, 106, 43),
      ),
      body: Stack(
        children: [
          // Background image
          if (tasks.isEmpty) // Show image only if tasks list is empty
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/taskB.png'),
                  fit: BoxFit.contain,
                  opacity: 0.3,
                ),
              ),
            ),
          ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return GestureDetector(
                onTap: () {
                  _editTaskDescription(context, index, task.description);
                },
                child: Dismissible(
                  key: Key(task.hashCode.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      tasks.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Task deleted'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              tasks.insert(index, task);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.description),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (newTask != null) {
            setState(() {
              tasks.add(newTask as Task);
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 223, 106, 43),
      ),
    );
  }

  void _editTaskDescription(
      BuildContext context, int index, String currentDescription) {
    TextEditingController _descriptionController =
        TextEditingController(text: currentDescription);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task Description'),
          content: TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('SAVE'),
              onPressed: () {
                setState(() {
                  tasks[index] = Task(
                    title: tasks[index].title,
                    description: _descriptionController.text,
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
