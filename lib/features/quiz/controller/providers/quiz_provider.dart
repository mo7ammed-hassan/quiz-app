
import 'package:flutter/material.dart';
import 'package:quizapp/features/quiz/presentation/models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  final List<QuestionModel> _questions = QuestionModel.getQuestions();

  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  bool? _isCorrectAnswer;
  int _score = 0;

  List<QuestionModel> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  bool? get isCorrectAnswer => _isCorrectAnswer;
  int get score => _score;

  void selectedAnswer(int index) {
    if (_selectedAnswerIndex == null) {
      _selectedAnswerIndex = index;
      _isCorrectAnswer =
          _questions[_currentQuestionIndex].options[index].isCorrect;
    }
    if (_isCorrectAnswer!) {
      _score++;
    }
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
      _isCorrectAnswer = null;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _selectedAnswerIndex = null;
    _isCorrectAnswer = null;
    _score = 0;
    notifyListeners();
  }

  bool isQuizComplete() {
    return _currentQuestionIndex == _questions.length - 1;
  }
}
