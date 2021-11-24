// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Question.dart';
import 'package:flutter_application_1/widgets/answer.dart';
import 'package:flutter_application_1/widgets/progress_bar.dart';
import 'package:flutter_application_1/widgets/quiz.dart';
import 'package:flutter_application_1/widgets/result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuestionData data = QuestionData();
  int _result = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  void _onAnswerChange(bool isCorrect) => setState(() {
        if (isCorrect) {
          _icons.add(Icon(Icons.brightness_1, color: Colors.green));
          _result++;
        } else {
          _icons.add(Icon(Icons.brightness_1, color: Colors.red));
        }

        _questionIndex++;
      });

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Minecraft'),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              )),
          child: Column(
            children: <Widget>[
              ProgressBar(
                icons: _icons,
                count: _questionIndex,
                total: data.questions.length,
              ),
              _questionIndex < data.questions.length
                  ? Quiz(
                      index: _questionIndex,
                      questionData: data,
                      onAnswerChange: _onAnswerChange,
                    )
                  : Result(
                      total: data.questions.length,
                      count: _result,
                    )
            ],
          ),
        ));
  }
}
