import 'package:actpod_mental_test/repositories/answer.dart';
import 'package:actpod_mental_test/repositories/question.dart';
import 'package:actpod_mental_test/repositories/result.dart';
import 'package:actpod_mental_test/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ResultRepository resultRepository = ResultRepository();
QuestionRepository questionRepository = QuestionRepository();
AnswerRepository answerRepository = AnswerRepository();

void main() {
  answerRepository.initAnswer();
  runApp(ProviderScope(child: const ActPodMentalTest()));
}

class ActPodMentalTest extends StatelessWidget {
  const ActPodMentalTest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(412, 915),
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ActPod 心理測驗',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          ),
          home: child,
        );
      },
      child: HomeScreen()
    );
  }
}