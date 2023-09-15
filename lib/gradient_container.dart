import 'package:first_project/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const beginAlignment = Alignment.bottomLeft;
const endAlignment = Alignment.topRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startQuiz, {super.key});

  final Function(String) startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Aya & Ori', style: GoogleFonts.rubik(
              color: Color.fromARGB(255, 246, 255, 163),
              fontSize: 25
            ),),
            const SizedBox(height: 20),
            Image.asset(
              'assets/1.jpg',
              width: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                startQuiz('quiz-screen');
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  )),
              child: Text(
                'מתחיליםות בחידון',
                style: GoogleFonts.rubik(
                  color: Colors.white70,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
