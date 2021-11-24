import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String? title;
  final String? taskBody;

  TaskCard({this.title, this.taskBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Text(
            title ?? 'Title',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            taskBody ?? 'No text added',
            style:
                TextStyle(color: Colors.grey[600], fontSize: 16, height: 1.5),
          )
        ],
      ),
    );
  }
}
