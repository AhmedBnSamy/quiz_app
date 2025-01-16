import 'package:quiz_app/question.dart';

class QuizTrain {
  int quizTrainNumber = 0;
  final List<Question> questionBank = [
    Question('Some cats are actually allergic to humans', ['True', 'False', 'Maybe', 'Not Sure'], 0),
    Question('You can lead a cow down stairs but not up stairs.', ['True', 'False', 'Maybe', 'Not Sure'], 1),
    Question('one summation two equals :......', ['one', 'two', 'three', 'apple'], 2),

    Question('one summation one equals :......', ['one', 'two', 'three', 'apple'], 1),
    Question('one summation zero equals :......', ['one', 'two', 'three', 'apple'], 0),
    Question('one summation three equals :......', ['one', 'two', 'four', 'apple'], 2),
    Question('one summation four equals :......', ['one', 'two', 'five', 'apple'], 2),
    Question('one summation five equals :......', ['one', 'two', 'six', 'apple'], 2),
    Question('one time two equals :......', ['one', 'two', 'seven', 'apple'], 1),
    Question('one time three equals :......', ['one', 'three', 'eight', 'apple'], 1),
    // Add more questions here
  ];

  void nextQuestion() {
    if (quizTrainNumber < questionBank.length - 1) {
      quizTrainNumber++;
    }
  }

  String getQuestionText() {
    return questionBank[quizTrainNumber].questionText;
  }

  List<String> getChoices() {
    return questionBank[quizTrainNumber].choices;
  }

  int getCorrectAnswerIndex() {
    return questionBank[quizTrainNumber].correctAnswerIndex;
  }

  bool isFinished() {
    return quizTrainNumber >= questionBank.length - 1;
  }

  void reset() {
    quizTrainNumber = 0;
  }
}