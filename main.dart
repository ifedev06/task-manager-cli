import 'dart:io';

void main() {
  final taskList = LoadTasks();

  while (true) {
    print('\n Welcome to TESA (My Task Manager)');
    print('\n 1. Add Task');
    print('\n 2. View Tasks');
    print('\n 3. Update Task');
    print('\n 4. Delete');
    print('\n 5. Exit');
    stdout.write('Select an option above: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        taskList.addTask();
        break;
      case '2':
        taskList.viewTasks();
        break;
      case '3':
        taskList.updateTask();
        break;
      case '4':
        taskList.deleteTask();
        break;
      case '5':
        exit(0);
        break;
      default:
        print('Invalid choice. Please try again.\n');
    }
  }
}

class Task {
  String title;
  String description;
  bool isComplete;

  Task(this.title, this.description, this.isComplete);
}

class LoadTasks {
  List<Task> tasks = [];

  void addTask() {
    stdout.write('Enter task title: ');
    String title = stdin.readLineSync()!;
    stdout.write('Enter task description: ');
    String description = stdin.readLineSync()!;
    tasks.add(Task(title, description, false));
    print('Task created successfully!\n');
  }

  void viewTasks() {
    if (tasks.isEmpty) {
      print('No tasks available.\n');
    } else {
      for (var i = 0; i < tasks.length; i++) {
        print(
            '${i + 1}. Title: ${tasks[i].title}, Description: ${tasks[i].description}, Status: ${tasks[i].isComplete ? "Completed" : "Not Completed"}');
      }
      print('');
    }
  }

  void updateTask() {
    if (tasks.isEmpty) {
      print('No tasks available to update.\n');
      return;
    }

    viewTasks();

    stdout.write('Enter the task number to update: ');
    int taskNumber = int.parse(stdin.readLineSync()!) - 1;

    if (taskNumber < 0 || taskNumber >= tasks.length) {
      print('Invalid task number. Please try again.\n');
      return;
    }

    stdout.write('Enter the new title (leave empty to keep current): ');
    String newTitle = stdin.readLineSync()!;
    if (newTitle.isNotEmpty) {
      tasks[taskNumber].title = newTitle;
    }

    stdout.write('Enter the new description (leave empty to keep current): ');
    String newDescription = stdin.readLineSync()!;
    if (newDescription.isNotEmpty) {
      tasks[taskNumber].description = newDescription;
    }

    print('Task updated successfully!\n');
  }

  void deleteTask() {
    if (tasks.isEmpty) {
      print('No tasks available to delete.\n');
      return;
    }

    viewTasks();

    stdout.write('Enter the task number to delete: ');
    int taskNumber = int.parse(stdin.readLineSync()!) - 1;

    if (taskNumber < 0 || taskNumber >= tasks.length) {
      print('Invalid task number. Please try again.\n');
      return;
    }

    tasks.removeAt(taskNumber);
    print('Task deleted successfully!\n');
  }
}
