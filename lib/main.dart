import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quizPage.dart';

void main (){
  runApp(quizApp());
}

class quizApp extends StatelessWidget {
  const quizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
        )
      ),home: quizPage(),
    );
  }
}
