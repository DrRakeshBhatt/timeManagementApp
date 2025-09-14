import 'package:flutter/material.dart';
import 'package:time_manager/login_screen.dart';

void main() {
  runApp(TimeManagerApp());
}

class TimeManagerApp extends StatelessWidget {
  const TimeManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen(), debugShowCheckedModeBanner: false);
  }
}
