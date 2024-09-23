import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/features/home/presentation/views/home_view.dart';
import 'package:quizapp/features/quiz/controller/providers/circular_countdown_provider.dart';
import 'package:quizapp/features/quiz/controller/providers/quiz_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CircularCountDownProvider(totalTime: 30),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
