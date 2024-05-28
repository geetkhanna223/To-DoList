// class Task {
//   String task;
//   DateTime time;

// //aTask({this.task, this.time});
// Task({this.task = '', DateTime? time}) : time = time ?? DateTime.now();

//   factory Task.fromString(String task) {
//     return Task(
//       task: task,
//       time: DateTime.now(),
//     );
//   }


//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task(
//       task: map['task'],
//       time: DateTime.fromMicrosecondsSinceEpoch(map['time']),
//     );
//   }

//   Map<String, dynamic> getMap(){
//     return{
//       'task': task,
//       'time': time.millisecondsSinceEpoch,
//     };
//   }


// }




class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}
