import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos});
  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (ctx, index) => TodoItem(
        todo: todos[index],
      ),
    );
  }
}
