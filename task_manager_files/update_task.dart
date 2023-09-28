import 'dart:io';

class UpdateTask {
  void updateTask(List<Task> tasks) {
    if (tasks.isEmpty) {
      print('No tasks available to update.\n');
      return;
    }

    ViewTasks().viewTasks(tasks);

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

    stdout.write(
        'Enter the new description (leave empty to keep current): ');
    String newDescription = stdin.readLineSync()!;
    if (newDescription.isNotEmpty) {
      tasks[taskNumber].description = newDescription;
    }

    print('Task updated successfully!\n');
  }
}

class Task {
  String title;
  String description;
  bool isComplete;

  Task(this.title, this.description, this.isComplete);
}
