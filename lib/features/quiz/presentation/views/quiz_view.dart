import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/features/home/presentation/views/widgets/custom_eleveted_button.dart';
import 'package:quizapp/features/quiz/presentation/models/question_model.dart';
import 'package:quizapp/features/quiz/presentation/views/score_view.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/answer_card.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/custom_quiz_app_bar.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/quiz_card.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final List<QuestionModel> questions = QuestionModel.getQuestions();
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool? isCorrectAnswer;
  int score = 0;
  void _goToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        isCorrectAnswer = null;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ScoreView(
              score: score,
              numOfQuestions: questions.length,
            );
          },
        ),
      );
    }
  }

  void _checkAnswer(int index) {
    if (selectedAnswerIndex == null) {
      setState(() {
        selectedAnswerIndex = index;
        isCorrectAnswer =
            questions[currentQuestionIndex].options[index].isCorrect;
        if (isCorrectAnswer!) {
          score++;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quizaBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              CustomQuizAppBar(
                numOfQuestions: questions.length,
                currentQuestionIndex: currentQuestionIndex,
              ),
              QuizCard(
                question: questions[currentQuestionIndex].question,
                onTimerEnd: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ScoreView(
                        score: score,
                        numOfQuestions: questions.length,
                      );
                    },
                  ));
                },
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: questions[currentQuestionIndex].options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _checkAnswer(index);
                        },
                        child: AnswerCard(
                          title: questions[currentQuestionIndex]
                              .options[index]
                              .answer,
                          isSelected: selectedAnswerIndex == index,
                          isCorrect: questions[currentQuestionIndex]
                              .options[index]
                              .isCorrect,
                          showFeedback: selectedAnswerIndex != null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomElevetedutton(
                title: currentQuestionIndex == questions.length - 1
                    ? 'Submit'
                    : 'Next',
                btnColor: primaryColor,
                onPressed: () {
                  _goToNextQuestion();
                },
              ),
              const SizedBox(height: 22)
            ],
          ),
        ),
      ),
    );
  }
}
