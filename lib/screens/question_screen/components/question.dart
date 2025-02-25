import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/repositories/question.dart';
import 'package:actpod_mental_test/screens/question_screen/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Question extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionNum = ref.watch(questionNumProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionRepository.getQuestions()[questionNum].question,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold
          )
        )
      ],
    );
  }
}