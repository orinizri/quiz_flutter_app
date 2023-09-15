import 'dart:ffi';

import 'package:first_project/data/questions.dart';
import 'package:first_project/gradient_container.dart';
import 'package:first_project/questions_screen.dart';
import 'package:first_project/results_screen.dart';
import 'package:flutter/material.dart';

const beginAlignment = Alignment.bottomLeft;
const endAlignment = Alignment.topRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';
  void switchScreens(String screen) {
    if (screen == 'start-screen') {
      setState(() {
        selectedAnswers = [];
      });
    }
    setState(() {
      activeScreen = screen;
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers.length);
    print(questions.length);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = GradientContainer(switchScreens);
    if (activeScreen == 'quiz-screen') {
      setState(() {
        screenWidget = QuestionsScreen(selectAnswer);
      });
    } else if (activeScreen == 'results-screen') {
      setState(() {
        screenWidget = ResultsScreen(selectedAnswers, switchScreens);
      });
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: beginAlignment,
              end: endAlignment,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
