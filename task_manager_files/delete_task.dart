import 'dart:io';

import 'view_tasks.dart';

class DeleteTask {
  void deleteTask(List<Task> task) {
    if (task.isEmpty) {
      print('No task available to delete.\n');
      return;
    }
    ViewTasks().viewTasks(tasks);


    stdout.write('Enter the task number to delete: ');
    int taskNumber = int.parse(stdin.readLineSync()!) -1;

    if (taskNumber < 0 || taskNumber >= task.length) {
      print('Invalid task number. Please try again.\n');
      return;
    }

    task.removeAt(taskNumber);
    print('Task delered successfully!\n');
  }
}

class Task {
  String title;
  String description;
  bool isComplete;

  Task(this.title, this.description, this.isComplete);
}