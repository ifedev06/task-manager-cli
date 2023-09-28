import 'dart:io';


List<String> addTask(List<String> taskList) {
  stdout.write('Enter a task: ');
  final task =stdin.readLineSync();
  if (task != null && task.isEmpty){
    taskList.add(task);
    print('Task added SUccessfully. ');

  }else {
    print('Task cannot be empty. ');
  }
  return taskList;
}