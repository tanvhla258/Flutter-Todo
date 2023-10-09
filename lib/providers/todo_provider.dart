import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/todo.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  bool toggleTodo(Todo todo) {
    return true;
  }
}

final TodosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});
