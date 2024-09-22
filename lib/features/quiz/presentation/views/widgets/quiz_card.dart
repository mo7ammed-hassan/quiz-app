import 'package:flutter/material.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/circular_count_down.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/question_conatiner_decoration.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
  });

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
            child: const CircularCountDown(
              totalTime: 30,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: (229 / 2) - 50,
            horizontal: 18,
          ),
          child: Text(
            'In what year did the United States host the FIFA World Cup for the first time?',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
