import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo.dart';

final formatter = DateFormat.yMd();

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.togglecheck, required this.todo});
  final void Function(Todo) togglecheck;

  final Todo todo;
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    final Todo todo = widget.todo;
    final toggleCheck = widget.togglecheck;

    // Access todo using widget.todo
    // Access todo using widget.todo
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Checkbox(
                value: todo.isDone,
                onChanged: (isChecked) {
                  setState(() {
                    toggleCheck(todo);
                  });
                }),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    todo.title),
                Text(formatter.format(todo.createAt),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
