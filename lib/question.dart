import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(30),
      child: Text(
        questionText,
        // ignore: prefer_const_constructors
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
