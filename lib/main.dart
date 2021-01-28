import 'package:dicoding_submission/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies Apps",
      theme: ThemeData.dark(),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

