import 'package:actpod_mental_test/entities/answer.dart';
import 'package:actpod_mental_test/entities/question.dart';
import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/screens/question_screen/providers.dart';
import 'package:actpod_mental_test/screens/result_screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/star.svg',
          width: isPhone ? 30.w : 15.w,
          fit: BoxFit.fitWidth,
        ),
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
            width: isPhone ? 300.w : 150.w,
            margin: EdgeInsets.only(bottom: isPhone? 20.h : 12.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: Text(
              option.text,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: isPhone? 16.w : 8.w,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )
            ),
          )
        )
      ],
    );
  }
}