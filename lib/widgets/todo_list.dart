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
  final List<Todo> todos = [
    Todo(
        id: '3',
        title: 'hello',
        details: 'ewrwer',
        createAt: DateTime.now(),
        isDone: false),
    Todo(
        id: '4',
        title: 'Hi',
        details: 'ewrwer',
        createAt: DateTime.now(),
        isDone: true),
  ];

  void _addItem(BuildContext context) async {
    final newItem = await Navigator.of(context)
        .push<Todo>(MaterialPageRoute(builder: (ctx) => const NewTodo()));

    if (newItem == null) {
      return;
    }
    setState(() {
      todos.add(newItem);
    });
  }

  void toggleCheck(Todo todo) {
    setState(() {
      todo.toggleStatus();
    });
  }

  void _removeItem(Todo todo) {
    final todoIndex = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                todos.insert(todoIndex, todo);
              });
            }),
        duration: const Duration(seconds: 3),
        content: const Text('todo deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('To do list'),
            actions: [
              IconButton(
                  onPressed: () {
                    _addItem(context);
                  },
                  icon: const Icon(Icons.add))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.all_inbox_sharp),
                  text: 'Show all',
                ),
                Tab(icon: Icon(Icons.done), text: 'Completed'),
                Tab(
                  icon: Icon(Icons.note_alt),
                  text: 'Incomplete',
                ),
              ],
            ),
          ),
          body: todos.isNotEmpty
              ? TabBarView(
                  children: [
                    TodoListView(
                      togglecheck: toggleCheck,
                      todos: todos,
                      removeItem: _removeItem,
                    ),
                    TodoListView(
                      togglecheck: toggleCheck,
                      todos: todos.where((todo) => todo.isDone).toList(),
                      removeItem: _removeItem,
                    ),
                    TodoListView(
                      togglecheck: toggleCheck,
                      todos: todos.where((todo) => !todo.isDone).toList(),
                      removeItem: _removeItem,
                    ),
                  ],
                )
              : Center(
                  child: Text(
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                      'Add something new'),
                ),
        ));
  }
}

class TodoListView extends StatelessWidget {
  final List<Todo> todos;
  const TodoListView(
      {required this.todos,
      required this.togglecheck,
      required this.removeItem,
      Key? key})
      : super(key: key);
  final void Function(Todo) removeItem;
  final void Function(Todo) togglecheck;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length + 1, // Add 1 for the extra line of text
      itemBuilder: (ctx, index) {
        if (index < todos.length) {
          return Dismissible(
            key: ValueKey(todos[index]),
            onDismissed: (direction) {
              removeItem(todos[index]);
            },
            background: Container(
              margin: Theme.of(context).cardTheme.margin,
              color: Theme.of(context).colorScheme.error.withOpacity(0.5),
            ),
            child: TodoItem(
              togglecheck: togglecheck,
              todo: todos[index],
            ),
          );
        } else {
          // This is the extra line of text at the bottom
          return todos.isNotEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Swipe left to clear',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              : Container();
        }
      },
    );
  }
}
