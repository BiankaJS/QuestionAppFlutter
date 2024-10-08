import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart
  });

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24
                ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Restart Quiz!.',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
            ),
          ],
        ),
      ),
    );
  }
}