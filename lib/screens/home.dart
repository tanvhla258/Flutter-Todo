import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/new_todo.dart';
import 'package:todo/widgets/todo_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  void _addItem(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewTodo()));
  }

  @override
  Widget build(BuildContext context) {
    final List<Todo> today = [
      Todo(id: '2', title: 'Go to school', createAt: DateTime.now())
    ];

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          actions: [
            IconButton(
                onPressed: () {
                  _addItem(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: TodoList(todos: today),
      ),
    );
  }
}
