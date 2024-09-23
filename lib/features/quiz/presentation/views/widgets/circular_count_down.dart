import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';

class CircularCountDown extends StatefulWidget {
  final int totalTime;
  final VoidCallback onTimerEnded;
  const CircularCountDown(
      {super.key, required this.totalTime, required this.onTimerEnded});

  @override
  State<CircularCountDown> createState() => _CircularCountDownState();
}

class _CircularCountDownState extends State<CircularCountDown> {
  late Timer _timer;
  int _remainingTime = 0;
  double _progress = 1.0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = widget.totalTime;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
          _progress = _remainingTime / widget.totalTime;
        });
      } else {
        _timer.cancel();
        widget.onTimerEnded();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: CircularProgressIndicator(
            value: _progress,
            strokeWidth: 5,
            valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
            backgroundColor: procressIndecatorBgColor,
          ),
        ),
        Text(
          '$_remainingTime',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
