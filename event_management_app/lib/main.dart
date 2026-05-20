
import 'package:event_management_app/Widgets/my_events.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
void main() {
  //debugPaintSizeEnabled = true; // Set to true to enable visual debugging of layout
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyEvents();
  }
}