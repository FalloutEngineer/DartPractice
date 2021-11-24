import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final index;
  final questionData;
  final onAnswerChange;
  const Quiz({Key? key, this.index, this.questionData, this.onAnswerChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            questionData.questions[index].title ?? '',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ...questionData.questions[index].answers!
            .map((value) => Answer(
                  title: value['answer'],
                  onAnswerChange: onAnswerChange,
                  isCorrect: value.containsKey('isCorrect') ? true : false,
                ))
            .toList(),
      ],
    );
  }
}
