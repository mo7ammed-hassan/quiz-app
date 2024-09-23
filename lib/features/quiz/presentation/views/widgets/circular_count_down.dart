import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/features/quiz/controller/providers/circular_countdown_provider.dart';

class CircularCountDown extends StatelessWidget {
  const CircularCountDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<CircularCountDownProvider>(context, listen: false).startTimer();
    return Consumer<CircularCountDownProvider>(
      builder: (context, countDownProvider, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: CircularProgressIndicator(
                value: countDownProvider.progress,
                strokeWidth: 5,
                valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                backgroundColor: procressIndecatorBgColor,
              ),
            ),
            Text(
              '${countDownProvider.remainingTime}',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
