import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_train.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_page.dart';

void main() {
  runApp(const MainQuiz());
}

class MainQuiz extends StatefulWidget {
  const MainQuiz({super.key});


  @override
  State<MainQuiz> createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizTrains(),
    );
  }
}

class QuizTrains extends StatefulWidget {
  const QuizTrains({super.key});

  @override
  State<QuizTrains> createState() => _QuizTrainState();
}

class _QuizTrainState extends State<QuizTrains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}
