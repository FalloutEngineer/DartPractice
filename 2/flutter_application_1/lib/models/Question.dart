// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class Question {
  final String? title;
  final List<Map>? answers;

  Question({@required this.title, @required this.answers});
}

class QuestionData {
  final _data = [
    Question(title: 'Как зовут зелёного взрывного моба?', answers: [
      {'answer': 'Крипер', 'isCorrect': 1},
      {'answer': 'Зомби'},
      {'answer': 'Фантом'},
      {'answer': 'Свинозомби'},
    ]),
    Question(title: 'Кто даёт молоко?', answers: [
      {'answer': 'Лошадь'},
      {'answer': 'Корова', 'isCorrect': 1},
      {'answer': 'Овца'},
      {'answer': 'Коза'},
    ]),
    Question(title: 'С какого моба падает железо??', answers: [
      {'answer': 'Дракон'},
      {'answer': 'Житель'},
      {'answer': 'Ифрит'},
      {'answer': 'Зомби', 'isCorrect': 1},
    ]),
    Question(title: 'Главный босс игры?', answers: [
      {'answer': 'Дракон', 'isCorrect': 1},
      {'answer': 'Херобрин'},
      {'answer': 'Визер'},
      {'answer': 'Железный голем'},
    ]),
    Question(title: 'Кто проживает на дне океана?', answers: [
      {'answer': 'Фантом'},
      {'answer': 'Страж', 'isCorrect': 1},
      {'answer': 'Кадавр'},
      {'answer': 'Ведьма'},
    ]),
  ];

  List<Question> get questions => [..._data];
}
