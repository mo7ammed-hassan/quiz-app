import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/features/quiz/controller/providers/circular_countdown_provider.dart';
import 'package:quizapp/features/quiz/controller/providers/quiz_provider.dart';

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
        leading: IconButton(
          onPressed: () {
            Provider.of<QuizProvider>(context, listen: false).resetQuiz();
            Provider.of<CircularCountDownProvider>(context).resetTimer();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score/$numOfQuestions',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
