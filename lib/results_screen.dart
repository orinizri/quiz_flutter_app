import 'package:first_project/data/questions.dart';
import 'package:first_project/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.answersList, this.switchScreens, {super.key});

  List<String> answersList;
  Function(String) switchScreens;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var chosenAnswersIndex = 0;
        chosenAnswersIndex < answersList.length;
        chosenAnswersIndex++) {
      summary.add({
        'question_index': chosenAnswersIndex,
        'answer': answersList[chosenAnswersIndex],
        'question': questions[chosenAnswersIndex].question,
        'correct_answer': questions[chosenAnswersIndex].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final numOfCorrectAnswers = summaryData
        .where((question) => question['correct_answer'] == question['answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'חיים שלי! ענית נכון על $numOfCorrectAnswers שאלות מתוך $totalQuestions <3',
              style: const TextStyle(
                color: Color.fromARGB(255, 134, 234, 247),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryList: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                switchScreens('start-screen');
              },
              child: const Text(
                'מרה תניה!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
