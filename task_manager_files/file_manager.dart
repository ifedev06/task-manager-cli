import 'dart:io';
import 'dart:convert';

import 'singlemain.dart';

class FileManager {
  final String fileName = 'tasks.json';

  void saveTasks(List<Task> tasks) {
    final File file = File(fileName);
    final List<Map<String, dynamic>> taskList =
        tasks.map((task) => task.toJson()).toList();
    file.writeAsStringSync(jsonEncode(taskList));
  }

  List<Task> loadTasks() {
    final File file = File(fileName);
    if (!file.existsSync()) {
      return [];
    }

    final String fileContents = file.readAsStringSync();
    final List<dynamic> taskListJson = jsonDecode(fileContents);
    final List<Task> tasks = taskListJson
        .map((taskJson) => Task.fromJson(taskJson))
        .toList()
        .cast<Task>();

    return tasks;
  }
}
