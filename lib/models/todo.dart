import 'package:flutter/material.dart';

class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.details,
    required this.createAt,
    required this.isDone,
  });
  final String id;
  final String title;
  final String details;
  final DateTime createAt;
  bool isDone;

  void toggleStatus() {
    isDone = !isDone;
  }
}
