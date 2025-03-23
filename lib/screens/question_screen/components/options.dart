import 'package:actpod_mental_test/entities/answer.dart';
import 'package:actpod_mental_test/entities/question.dart';
import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/screens/question_screen/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Options extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionNum = ref.watch(questionNumProvider);

    return ListView.builder(
      itemCount: questionRepository.getQuestions()[questionNum].options.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          child: option(context, ref, questionRepository.getQuestions()[questionNum].options[index], questionNum)
        );
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
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              answerRepository.insertAnswer(questionNum, Answer(option.x, option.y));
              if (questionNum == questionRepository.getQuestions().length - 1) {
                final answers = answerRepository.getAnswers();
                double x = 0;
                double y = 0;
                for (Answer answer in answers) {
                  x += answer.x;
                  y += answer.y;
                }
                final result = resultRepository.calculateResult(x, y);
                GoRouter.of(context).push('/${result.id}');
              } else {
                ref.watch(questionNumProvider.notifier).state =
                    ref.watch(questionNumProvider) + 1;
              }
            },
            splashColor: Colors.orange.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: isPhone ? 300.w : 240.w,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/star.svg',
                    width: isPhone ? 30.w : 15.w,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: 4.w),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      child: Text(
                        option.text,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: isPhone ? 16.sp : 8.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ),
                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}