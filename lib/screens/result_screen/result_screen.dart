import 'package:actpod_mental_test/entities/answer.dart';
import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/repositories/result.dart';
import 'package:actpod_mental_test/screens/result_screen/components/description.dart';
import 'package:actpod_mental_test/screens/result_screen/components/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answers = answerRepository.getAnswers();
    double x = 0;
    double y = 0;
    for(Answer answer in answers) {
      x = x + answer.x;
      y = y + answer.y;
    }
    final result = resultRepository.calculateResult(x, y);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ResultTitle(result),
            SizedBox(height: 12.h,),
            ResultDescription(result)
          ]
        )
      ),
    );
  }
}