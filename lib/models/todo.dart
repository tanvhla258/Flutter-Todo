import 'package:flutter/material.dart';

class Todo {
  const Todo({
    required this.id,
    required this.title,
    required this.createAt,
    this.isDone = false,
  });
  final String id;
  final String title;
  final DateTime createAt;
  final bool isDone;
}
