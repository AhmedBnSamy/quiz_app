
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_train.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizTrain quizTrain = QuizTrain();
  int length = QuizTrain().questionBank.length;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(int userPickedAnswerIndex) {
    int correctAnswerIndex = quizTrain.getCorrectAnswerIndex();
    setState(() {
      if (quizTrain.isFinished()) {
        if (userPickedAnswerIndex == correctAnswerIndex) {
          correctAnswers++;
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          wrongAnswers++;
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz. You got $correctAnswers correct answers from $length and $wrongAnswers wrong answers.',
        ).show();
        quizTrain.reset();
        scoreKeeper = [];
        correctAnswers = 0;
        wrongAnswers = 0;
      } else {
        if (userPickedAnswerIndex == correctAnswerIndex) {
          correctAnswers++;
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          wrongAnswers++;
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizTrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50.0),
        Spacer(flex: 1),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                quizTrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Spacer(flex: 1),
        ...quizTrain.getChoices().asMap().entries.map((entry) {
          int idx = entry.key;
          String choice = entry.value;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: const Size(280, 50),

              ),
              onPressed: () {
                checkAnswer(idx);
              },
              child: Text(
                choice,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          );
        }).toList(),
        Spacer(flex: 1),
        Row(
          children: scoreKeeper,
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}


