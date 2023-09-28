import 'dart:io';
import 'add_task.dart';
import 'view_tasks.dart';
import 'update_task.dart';
import 'delete_task.dart';

void main() {
  final addTask = AddTask();
  final viewTasks = ViewTasks();
  final updateTask = UpdateTask();
  final deleteTask = DeleteTask();

  while (true) {
    print('\n Welcome to TESA (My Task Manager)');
    print('\n 1. Add Task');
    print('\n 2. View Tasks');
    print('\n 3. Update Task');
    print('\n 4. Delete Task');
    print('\n 5. Save Tasks to File');
    print('\n 6. Load Tasks from File');
    print('\n 7. Exit');
    stdout.write('Select an option above: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addTask.addTask();
        break;
      case '2':
        viewTasks.viewTasks();
        break;
      case '3':
        updateTask.updateTask();
        break;
      case '4':
        deleteTask.deleteTask();
        break;
      case '5':
        // Save tasks to file
        break;
      case '6':
        // Load tasks from file
        break;
      case '7':
        exit(0);
        break;
      default:
        print('Invalid choice. Please try again.\n');
    }
  }
}