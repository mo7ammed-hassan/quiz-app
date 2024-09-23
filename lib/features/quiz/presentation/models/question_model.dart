import 'package:quizapp/features/quiz/presentation/models/answer_model.dart';

class QuestionModel {
  final String question;
  final List<AnswerModel> options;

  QuestionModel({required this.question, required this.options});

  static List<QuestionModel> getQuestions() {
    return [
      QuestionModel(
        question: 'What is the capital of France?',
        options: [
          AnswerModel('Paris', true),
          AnswerModel('London', false),
          AnswerModel('Berlin', false),
          AnswerModel('Madrid', false),
        ],
      ),
      QuestionModel(
        question: 'Who is the current Prime Minister of the United Kingdom?',
        options: [
          AnswerModel('David Cameron', false),
          AnswerModel('George Osborne', true),
          AnswerModel('Brian Connelly', false),
          AnswerModel('Sir George Osborne', false),
        ],
      ),
      QuestionModel(
        question: 'What is the capital of Spain?',
        options: [
          AnswerModel('Madrid', true),
          AnswerModel('Barcelona', false),
          AnswerModel('Valencia', false),
          AnswerModel('Seville', false),
        ],
      ),
      QuestionModel(
        question: 'What is the name of the largest ocean in the world?',
        options: [
          AnswerModel('Pacific Ocean', true),
          AnswerModel('Atlantic Ocean', false),
          AnswerModel('Indian Ocean', false),
          AnswerModel('Arctic Ocean', false),
        ],
      ),
    ];
  }
}
