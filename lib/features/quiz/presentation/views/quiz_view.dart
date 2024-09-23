import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/features/home/presentation/views/widgets/custom_eleveted_button.dart';
import 'package:quizapp/features/quiz/controller/providers/circular_countdown_provider.dart';
import 'package:quizapp/features/quiz/controller/providers/quiz_provider.dart';
import 'package:quizapp/features/quiz/presentation/views/score_view.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/answer_card.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/custom_quiz_app_bar.dart';
import 'package:quizapp/features/quiz/presentation/views/widgets/quiz_card.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quizaBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Consumer2<QuizProvider, CircularCountDownProvider>(
              builder: (context, quizProvider, countDownProvider, child) {
            if (countDownProvider.onTimerEnded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScoreView(
                      score: quizProvider.score,
                      numOfQuestions: quizProvider.questions.length,
                    ),
                  ),
                );
              });
            }
            return Column(
              children: [
                CustomQuizAppBar(
                  numOfQuestions: quizProvider.questions.length,
                  currentQuestionIndex: quizProvider.currentQuestionIndex,
                ),
                QuizCard(
                  question: quizProvider
                      .questions[quizProvider.currentQuestionIndex].question,
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView.builder(
                    itemCount: quizProvider
                        .questions[quizProvider.currentQuestionIndex]
                        .options
                        .length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            quizProvider.selectedAnswer(index);
                          },
                          child: AnswerCard(
                            title: quizProvider
                                .questions[quizProvider.currentQuestionIndex]
                                .options[index]
                                .answer,
                            isSelected:
                                quizProvider.selectedAnswerIndex == index,
                            isCorrect: quizProvider
                                .questions[quizProvider.currentQuestionIndex]
                                .options[index]
                                .isCorrect,
                            showFeedback:
                                quizProvider.selectedAnswerIndex != null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomElevetedutton(
                  title: quizProvider.isQuizComplete() ? 'Submit' : 'Next',
                  btnColor: primaryColor,
                  onPressed: () {
                    if (quizProvider.isQuizComplete()) {
                      countDownProvider.stopTimer();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScoreView(
                            score: quizProvider.score,
                            numOfQuestions: quizProvider.questions.length,
                          ),
                        ),
                      );
                    } else {
                      quizProvider.nextQuestion();
                    }
                  },
                ),
                const SizedBox(height: 22)
              ],
            );
          }),
        ),
      ),
    );
  }
}
