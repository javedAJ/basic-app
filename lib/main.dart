// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './question.dart';

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
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    // print('Answer Chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color ?',
      'what\'s your favorite animal'
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Quizz App")),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Question(questions.elementAt(_questionIndex)),
                ElevatedButton(
                    onPressed: answerQuestion, child: Text("data 1")),
                ElevatedButton(
                    onPressed: () => print("Answer 2 CHosen"),
                    child: Text("data 2")),
                ElevatedButton(
                    onPressed: () {
                      print("Answer 3 CHosen");
                    },
                    child: Text("data 3")),
              ],
            ),
          )),
    );
  }
}
