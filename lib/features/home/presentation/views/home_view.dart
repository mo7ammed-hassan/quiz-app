import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/features/home/presentation/views/widgets/custom_eleveted_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
              Container(
                width: 160,
                height: 160,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome to Quiz App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              const CustomElevetedutton(
                title: 'Start Quiz',
                btnColor: secoundryBtnColor,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
