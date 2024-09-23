import 'package:flutter/material.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/circular_count_down.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/question_conatiner_decoration.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.question,
    required this.onTimerEnd,
  });
  final String question;
  final VoidCallback onTimerEnd;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const QuestionConatinerDecoration(),
        Positioned(
          right: 0,
          left: 0,
          top: -45,
          child: Container(
            width: 65,
            height: 65,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.white,
            ),
            child: CircularCountDown(
              totalTime: 30,
              onTimerEnded: onTimerEnd,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: (229 / 2) - 50,
            horizontal: 18,
          ),
          child: Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
