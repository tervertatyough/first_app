import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var _totalScore = 0;

  void answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _questions = [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ]
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Snake', 'score': 5},
          {'text': 'Hippo', 'score': 4},
          {'text': 'Lion', 'score': 3},
          {'text': 'Tiger', 'score': 2}
        ]
      },
      {
        'questionText': 'Who\'s your favourite instructor',
        'answers': [
          {'text': 'Terver', 'score': 8},
          {'text': 'Junior', 'score': 6},
          {'text': 'Max', 'score': 4},
          {'text': 'Mosh', 'score': 1}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Quiz App")),
        body: questionIndex < _questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
