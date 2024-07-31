import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MinerdApp());
}

class MinerdApp extends StatelessWidget {
  const MinerdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MINERD Técnicos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}