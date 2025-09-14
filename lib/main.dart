import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
  runApp(TimeManagerApp());
}

class TimeManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen(), debugShowCheckedModeBanner: false);
  }
}
