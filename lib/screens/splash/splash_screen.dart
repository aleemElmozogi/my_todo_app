import 'package:flutter/material.dart';
import 'dart:async';

// تعريف ويدجت SplashScreen كفئة StatefulWidget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // بدء مؤقت لمدة 3 ثوانٍ ثم الانتقال إلى الشاشة الرئيسية
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // عرض النص في وسط الشاشة
          Center(
              child: Text(
                "Our TODO App",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          // إضافة مسافة بين النص ومؤشر التحميل الدائري
          SizedBox(
            height: 20,
          ),
          // عرض مؤشر التحميل الدائري
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
