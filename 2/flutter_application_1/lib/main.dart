// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Minecraft Quiz',
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme(
              caption: TextStyle(fontSize: 22.0, color: Colors.white),
              bodyText1: TextStyle(fontSize: 14, color: Colors.white)),
          fontFamily: 'Roboto',
        ),
        home: HomePage());
  }
}
