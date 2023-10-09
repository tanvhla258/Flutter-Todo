import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/todo.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Checkbox(value: todo.isDone, onChanged: (isChecked) {}),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.title),
              Text(formatter.format(todo.createAt),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
            ],
          ),
        ],
      ),
    );
  }
}
