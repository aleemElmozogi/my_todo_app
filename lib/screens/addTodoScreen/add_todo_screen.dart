// lib/screens/add_todo_screen.dart

import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';

// تعريف ويدجت AddTodoScreen كفئة StatefulWidget
class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  // دالة لإرسال البيانات
  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newTodo = TodoModel(
        title: _titleController.text,
        description: _descriptionController.text,
      );
      // العودة إلى الشاشة السابقة مع إرجاع المهمة الجديدة
      Navigator.pop(context, newTodo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo', // عنوان الشاشة
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // حقل إدخال العنوان
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title'; // رسالة خطأ عند عدم إدخال عنوان
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // حقل إدخال الوصف
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description'; // رسالة خطأ عند عدم إدخال وصف
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // زر الإضافة
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
