import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.isCorrect,
    required this.showFeedback,
  });

  final String title;
  final bool isSelected;
  final bool isCorrect;
  final bool showFeedback;

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor() {
      if (!showFeedback) return Colors.white;
      if (isSelected) {
        return isCorrect ? correctAnswerColor : Colors.red.shade400;
      }
      return Colors.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: getBackgroundColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: showFeedback && isSelected ? Colors.white : Colors.black,
              ),
            ),
            child: showFeedback && isSelected
                ? FittedBox(
                    child: Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel_rounded,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
