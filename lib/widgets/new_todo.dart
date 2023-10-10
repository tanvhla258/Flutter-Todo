import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key});

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';
  var _enteredDetails = '';

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).pop(
        Todo(
          id: DateTime.now().toString(),
          title: _enteredTitle,
          createAt: DateTime.now(),
          details: _enteredDetails,
          isDone: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 10,
                  decoration: const InputDecoration(label: Text('Title')),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 10) {
                      return 'Must be between 1 and 10 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredTitle = value!;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text('Details')),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 and 50 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredDetails = value!;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                        child: const Text('Reset')),
                    ElevatedButton(
                        onPressed: _saveItem, child: const Text('Add Item'))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
