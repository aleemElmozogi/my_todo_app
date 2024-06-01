// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todos = [];

  void _addTodoItem(TodoModel todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void _toggleTodoItem(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  void _deleteTodoItem(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _navigateToAddTodoScreen(BuildContext context) async {
    final newTodo = await Navigator.pushNamed(context, '/add') as TodoModel?;
    if (newTodo != null) {
      todos.add(newTodo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: todos.isEmpty
          ? const Center(child: Text("There's no Tasks at this moment"))
          : ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  onLongPress: () => todoProvider.removeTodoItem(index),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration:
                          todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(
                    todo.description,
                    style: TextStyle(
                      decoration:
                          todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  onTap: () => todoProvider.toggleTodoItem(index),
                  trailing: Checkbox(
                    value: todo.isDone,
                    onChanged: (value) {
                      todoProvider.toggleTodoItem(index);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddTodoScreen(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
