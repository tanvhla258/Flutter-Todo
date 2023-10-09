import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.id,
      required this.title,
      required this.details,
      required this.createAt,
      this.isDone = false});

  final String id;
  final String details;

  final String title;
  final DateTime createAt;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Checkbox(value: isDone, onChanged: (isChecked) {}),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(formatter.format(createAt),
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
