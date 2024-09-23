import 'dart:async';
import 'package:flutter/material.dart';

class CircularCountDownProvider with ChangeNotifier {
  final int totalTime;
  late Timer _timer;
  int _remainingTime;
  double _progress;
  bool onTimerEnded = false;

  CircularCountDownProvider({required this.totalTime})
      : _remainingTime = totalTime,
        _progress = 1.0;

  int get remainingTime => _remainingTime;
  double get progress => _progress;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        _progress = _remainingTime / totalTime;
      } else {
        _timer.cancel();
        onTimerEnded = true;
      }
      notifyListeners();
    });
  }

  void resetTimer() {
    _timer.cancel();
    _remainingTime = totalTime;
    _progress = 1.0;
    notifyListeners();
  }

  void stopTimer() {
    _timer.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
