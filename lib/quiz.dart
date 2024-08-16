import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen(onSeletedAnswer: chooseAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(onSeletedAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
        setState(() {
          activeScreen = ResultsScreen(chosenAnswer: selectedAnswers, onRestart: restartQuiz,);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 24, 158, 187),
                    Color.fromARGB(355, 78, 98, 122)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft
              )
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}