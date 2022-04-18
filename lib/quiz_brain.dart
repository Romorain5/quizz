import 'package:quizz/questions.dart';

class QuizBrain {
  int _questionIndex = 0;

  List<Questions> _questionBank = [
    Questions(
        'La vitesse de la lumière dans le vide correspond à 299 792 458 km/s',
        false),
    Questions('Le soleil est chaud', true),
    Questions('L\'eau mouille', true),
    Questions('La neige est froide', true),
    Questions(
        'Il est conseillé de mettre son séche-cheveux dans son bain pour réchauffer l\'eau',
        false),
  ];

  bool isFinished() {
    if (_questionIndex == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void goToNextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  void resetQuestionIndex() {
    _questionIndex = 0;
  }
}
