// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String title;
  final isCorrect;
  final Function onAnswerChange;

  const Answer(
      {Key? key,
      required this.title,
      this.isCorrect,
      required this.onAnswerChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAnswerChange(isCorrect),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10.0,
                offset: Offset(1.0, 1.0),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                colors: [Colors.green, Colors.brown],
                begin: Alignment(0, -1),
                end: Alignment(0, 0))),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
