import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/new_todo.dart';
import 'package:todo/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<TodoItem> todos = [];
  void _addItem(BuildContext context) async {
    final newItem = await Navigator.of(context)
        .push<TodoItem>(MaterialPageRoute(builder: (ctx) => const NewTodo()));

    if (newItem == null) {
      return;
    }
    setState(() {
      todos.add(newItem);
    });
  }

  void _removeItem() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your List'),
        actions: [
          IconButton(
              onPressed: () {
                _addItem(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (ctx, index) => TodoItem(
          id: todos[index].id,
          title: todos[index].title,
          details: todos[index].details,
          createAt: todos[index].createAt,
        ),
      ),
    );
  }
}
