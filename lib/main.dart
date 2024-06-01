import 'package:flutter/material.dart';
import 'package:my_todo_app/providers/todo_provider.dart';
import 'package:my_todo_app/screens/addTodoScreen/add_todo_screen.dart';
import 'package:my_todo_app/screens/homeScreen/home_screen.dart';
import 'package:my_todo_app/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo List',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => HomeScreen(),
          '/add': (context) => AddTodoScreen(),
        },
      ),
    );
  }
}
