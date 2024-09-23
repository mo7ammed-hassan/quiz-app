import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';

class ScoreView extends StatelessWidget {
  const ScoreView(
      {super.key, required this.score, required this.numOfQuestions});
  final int score;
  final int numOfQuestions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quizaBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Score',
          style: TextStyle(fontSize: 20, color: primaryColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score/$numOfQuestions',
              style: const TextStyle(fontSize: 22, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
