import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.summaryList});

  List<Map<String, Object>> summaryList;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: summaryList.map((summary) {
            return Row(
              children: [
                Text(((summary['question_index'] as int) + 1).toString(), style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 25,
                ),),
                Column(children: [
                  Text(
                    summary['question'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    const Text('התשובה שלך: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    Text(
                      summary['answer'] as String,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                      ),
                    )
                  ]),
                  Row(children: [
                    const Text(
                      'התשובה הנכונה: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      summary['correct_answer'] as String,
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20,
                      ),
                    )
                  ]),
                ]),
              ],
            );
          }).toList()),
        ),
      ),
    );
  }
}
