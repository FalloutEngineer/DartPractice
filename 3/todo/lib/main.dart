// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/widgets/task_page.dart';

import 'widgets/home.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
