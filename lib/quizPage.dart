import 'package:flutter/material.dart';
import 'package:quiz_app/bodyContainer.dart';

class quizPage extends StatelessWidget {
  const quizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade200,
        title: Text(
          'Quiz App',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1.0,
        shadowColor: Colors.grey,
      ),
      body: bodyContainer(),
    );
  }
}
