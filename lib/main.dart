import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'icon.dart';

QuizBrain quizbrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  void reset() {
    setState(() {
      scoreKeeper.clear();
      quizbrain.resetQuestionIndex();
    });
  }

  void checkAnswer(bool userPickedAnswer) {
    if (quizbrain.isFinished()) {
      Alert(
              context: context,
              title: 'Terminé !',
              type: AlertType.info,
              buttons: [
                DialogButton(
                  child: Text('Ok !'),
                  onPressed: () {
                    reset();
                    Navigator.pop(context);
                  },
                )
              ],
              content: Row(
                children: scoreKeeper,
              ),
              desc: 'Le quizz va redémarrer')
          .show();

      return;
    }
    bool correctAnswer = quizbrain.getQuestionAnswer();
    if (correctAnswer == userPickedAnswer) {
      scoreKeeper.add(getIcon(true));
    } else {
      scoreKeeper.add(getIcon(false));
    }
    setState(() {
      quizbrain.goToNextQuestion();
    });
  }
  //List<Question> questionList = [q1,q2,q3,q4];

  @override
  Widget build(BuildContext context) {
    //print(questionList[0].questionText);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(),
                //questionList[questionIdex].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'Vrai',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);

                //The user picked false.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'Faux',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/