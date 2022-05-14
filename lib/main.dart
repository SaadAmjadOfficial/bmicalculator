import 'package:bmicalculator/cal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue[900],
        scaffoldBackgroundColor: const Color(0xFF0A0E21)
      ),
      home: const Cal(),
    );
  }
}