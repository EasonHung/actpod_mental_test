
import 'package:actpod_mental_test/repositories/question.dart';
import 'package:actpod_mental_test/screens/question_screen/providers.dart';
import 'package:actpod_mental_test/screens/result_screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionNum = ref.watch(questionNumProvider);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ResultScreen())
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: Color(0xffff9f20),
        ),
        child: Text(
          questionNum == QuestionRepository().getQuestions().length - 1? "送出" : "下一題",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}