import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key});

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text('Title')),
                  validator: (value) {
                    return 'Demo..';
                  },
                ),
                Row(
                  children: [
                    Expanded(
                        child: InputDatePickerFormField(
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now())),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
