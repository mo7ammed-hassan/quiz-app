import 'package:flutter/material.dart';

class CustomQuizAppBar extends StatelessWidget {
  const CustomQuizAppBar({
    super.key,
    required this.currentQuestionIndex,
    required this.numOfQuestions,
  });
  final int currentQuestionIndex;
  final int numOfQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              const Text(
                'Previous',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Text(
            '${currentQuestionIndex + 1}/$numOfQuestions',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
