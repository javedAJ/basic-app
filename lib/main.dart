// ignore_for_file: prefer_const_constructors

import 'package:basic_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyappState();
  }
}

class _MyappState extends State<Myapp> {
  // ignore: prefer_final_fields
  var _questions = [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answers': [
        {'text': 'Sheep', 'score': 10},
        {'text': 'Dog', 'score': 20},
        {'text': 'Cat', 'score': 30},
      ],
    },
    {
      'questionText': 'who\'s your favorite instructor',
      'answers': [
        {'text': 'Javed', 'score': 10},
        {'text': 'Javed', 'score': 10},
        {'text': 'Javed', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We Have More QUestions!");
    } else {
      print("No More Questions");
    }
    // print('Answer Chosen');
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Basic Quiz App")),
        ),
        body: SafeArea(
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
          // : Center(
          //     child: Text('You did it!'),
        ),
      ),

      //Using Listview Builder

      // ListView.builder(
      //   itemCount: questions.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(questions[index].toString()),
      //     );
      //   },
      // ),
    );
  }
}
