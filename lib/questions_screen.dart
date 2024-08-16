import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSeletedAnswer});

  final void Function(String answer) onSeletedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSeletedAnswer(selectedAnswer);
    //currentQuestionIndex = currentQuestionIndex + 1;
    //currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; //Increments the values by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white
              ),
              textAlign: TextAlign.center, 
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  }
                  );
            }),
          ],
        ),
      ),
    );
  }
}