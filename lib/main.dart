import 'package:flutter/material.dart';
import 'package:learning_app/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite game?',
      'answers': [
        {'text': 'WoW', 'score': 10},
        {'text': 'LoL', 'score': 4},
        {'text': 'Overwatch', 'score': 1},
        {'text': 'Fifa', 'score': 7},
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Pancakes', 'score': 4},
        {'text': 'Pizza', 'score': 1},
        {'text': 'Tacos', 'score': 2},
        {'text': 'Salmon', 'score': 7},
      ],
    },
    {
      'questionText': 'Do you like Flutter?',
      'answers': [
        {'text': 'Yes', 'score': 2},
        {'text': 'No', 'score': 8},
        {'text': '????', 'score': 4},
        {'text': 'yaaas', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
