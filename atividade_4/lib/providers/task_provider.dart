import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(String title) {
    state = [...state, Task(title: title)];
  }
  
                                             
  void removeTask(Task task) {
    state = state.where((t) => t != task).toList();
  }

  void toggleTask(Task task) {
    task.isDone = !task.isDone;
    state = [...state];
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>(
  (ref) => TaskNotifier(),
);