import 'package:flutter/material.dart';

class QuestionConatinerDecoration extends StatelessWidget {
  const QuestionConatinerDecoration({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 383 / 229,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
}
