import 'package:event_management_app/Widgets/home_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
void main() {

 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
