import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/features/home/presentation/views/widgets/custom_eleveted_button.dart';
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
          child: Column(
            children: [
              const CustomQuizAppBar(),
              const QuizCard(),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AnswerCard(),
                    );
                  },
                ),
              ),
              CustomElevetedutton(
                title: 'Next',
                btnColor: primaryColor,
                onPressed: () {},
              ),
              const SizedBox(height: 22)
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xffABD1C6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Question',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: const ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(color: Colors.black),
              ),
              color: primaryColor,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}
