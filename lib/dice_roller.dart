import 'package:flutter/material.dart';
import 'dart:math';

final randomized = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceURL = "assets/images/dice-3.png";
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomized.nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$currentDiceRoll.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(left: 5, right: 5),
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
