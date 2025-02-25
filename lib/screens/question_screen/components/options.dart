import 'package:actpod_mental_test/entities/answer.dart';
import 'package:actpod_mental_test/entities/question.dart';
import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/screens/question_screen/providers.dart';
import 'package:actpod_mental_test/screens/result_screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Options extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionNum = ref.watch(questionNumProvider);

    return ListView.builder(
      itemCount: questionRepository.getQuestions()[questionNum].options.length,
      itemBuilder: (context, index) {
        return option(context, ref, questionRepository.getQuestions()[questionNum].options[index], questionNum);
      },
    );
  }

  Widget option(BuildContext context, WidgetRef ref, Option option, int questionNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            answerRepository.insertAnswer(questionNum, Answer(option.x, option.y));
            if(questionNum == questionRepository.getQuestions().length - 1) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ResultScreen())
              );
            } else {
              ref.watch(questionNumProvider.notifier).state = ref.watch(questionNumProvider) + 1;
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 12.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: Colors.grey
            ),
            child: Text(
              option.text,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white
              )
            ),
          )
        )
      ],
    );
  }
}