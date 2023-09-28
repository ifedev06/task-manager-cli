import 'singlemain.dart';

class ViewTasks {
  void viewTasks(List<Task> tasks) {
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
}
