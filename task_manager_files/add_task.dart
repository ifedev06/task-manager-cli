import 'dart:io';

class AddTask {
  List<Task> tasks = [];

  void addTask() {
    stdout.write('Enter task title that you want to add: ');
    String title = stdin.readLineSync()!;
    stdout.write("Enter the Description for the task: ");
    String description = stdin.readLineSync()!;
    tasks.add(Task(title, description, false));
    print('Task created successfully! \n');

  }
}

class Task {
  String title; 
  String description;
  bool isComplete;

  Task(this.title, this.description, this.isComplete);
}