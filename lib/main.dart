// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

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
  var _questionIndex = 0;

  void answerQuestion() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        // _questionIndex = _questionIndex + 1;
      });
    });

    print(_questionIndex);
    // print('Answer Chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color ?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'what\'s your favorite animal',
        'answers': ['Dog', 'Cat', 'Mouse', 'Zebra'],
      },
      {
        'questionText': 'who\'s your favorite instructor',
        'answers': ['Max', 'Max', 'Max', 'Max'],
      },
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Basic Quiz App")),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Question(questions[_questionIndex]['questionText'].toString()),
                ...(questions[_questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return Answer(answerQuestion, answer);
                }).toList()
              ],
            ),
          ),
        ));
  }
}
