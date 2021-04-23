import 'package:flutter/material.dart';
import 'package:mist/Screens/Home.dart';
import 'package:mist/Screens/Loading%20Screen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading_Screen()
    );
  }
}