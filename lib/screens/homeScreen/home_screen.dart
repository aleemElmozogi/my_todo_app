import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';

// تعريف ويدجت HomeScreen كفئة StatefulWidget
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todos = [];

  // دالة لإضافة مهمة جديدة
  void _addTodoItem(TodoModel todo) {
    setState(() {
      todos.add(todo);
    });
  }

  // دالة لتبديل حالة المهمة (منجزة أم لا)
  void _toggleTodoItem(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  // دالة لحذف مهمة
  void _deleteTodoItem(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  // دالة للانتقال إلى شاشة إضافة مهمة جديدة
  void _navigateToAddTodoScreen(BuildContext context) async {
    final newTodo = await Navigator.pushNamed(context, '/add') as TodoModel?;
    if (newTodo != null) {
      _addTodoItem(newTodo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List', // عنوان التطبيق
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      // عرض رسالة إذا لم تكن هناك مهام
      body: todos.isEmpty
          ? const Center(child: Text("There's no Tasks at this moment"))
          : ListView.builder(
              itemCount: todos.length, // عدد المهام
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  // حذف المهمة عند الضغط المطول
                  onLongPress: () => _deleteTodoItem(index),
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
                  // تبديل حالة المهمة عند الضغط عليها
                  onTap: () => _toggleTodoItem(index),
                  trailing: Checkbox(
                    value: todo.isDone,
                    onChanged: (value) {
                      _toggleTodoItem(index);
                    },
                  ),
                );
              },
            ),
      // زر إضافة مهمة جديدة
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddTodoScreen(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
