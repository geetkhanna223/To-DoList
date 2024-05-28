import 'package:flutter/material.dart';
import 'package:taskmanager/model/task.dart';
import 'package:google_fonts/google_fonts.dart';


class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task',
        style: GoogleFonts.montserrat(
          fontWeight:FontWeight.w700,
        ),),
        backgroundColor: Color.fromARGB(255, 235, 137, 84),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.sentences,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 235, 137, 84)),
              ),
              onPressed: () {
                final title = _titleController.text;
                final description = _descriptionController.text;
                if (title.isNotEmpty && description.isNotEmpty) {
                  final newTask = Task(title: _titleController.text, description: _descriptionController.text);
                  Navigator.pop(context, newTask);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill all fields.'),
                    ),
                  );
                }
              },
              child: Text('Add Task',
        style: GoogleFonts.montserrat(
            fontWeight:FontWeight.w600,
            color:Color.fromARGB(255, 0, 0, 0),
          ),),
            ),
          ],
        ),
      ),
    );
  }
}
