import 'package:flutter/material.dart';
import 'package:my_todo_app/screens/addTodoScreen/add_todo_screen.dart';
import 'package:my_todo_app/screens/homeScreen/home_screen.dart';
import 'package:my_todo_app/screens/splash/splash_screen.dart';

// دالة main تبدأ تشغيل التطبيق
void main() {
  runApp(const MyApp());
}

// تعريف ويدجت MyApp كفئة StatefulWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List', // عنوان التطبيق
      theme: ThemeData(
        primarySwatch: Colors.purple, // لون التمييز الرئيسي للتطبيق
      ),
      debugShowCheckedModeBanner: false, // إخفاء شريط تصحيح الأخطاء
      initialRoute: '/', // تحديد المسار الابتدائي للتطبيق
      routes: {
        '/': (context) =>
            const SplashScreen(), // المسار الرئيسي يعرض شاشة البداية
        '/home': (context) => HomeScreen(), // المسار إلى الشاشة الرئيسية
        '/add': (context) =>
            AddTodoScreen(), // المسار إلى شاشة إضافة مهمة جديدة
      },
    );
  }
}
