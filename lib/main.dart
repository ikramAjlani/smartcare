import 'package:flutter/material.dart';
import 'package:smartcare_project/ui/screens/auth/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: _buildCustomTheme(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),

      home: welcomescreen(),
    );
  }

  ThemeData _buildCustomTheme() {
    final base = ThemeData.light();
    return base;
  }
}
