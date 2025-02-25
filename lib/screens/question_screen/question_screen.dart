import 'package:actpod_mental_test/screens/question_screen/components/next_button.dart';
import 'package:actpod_mental_test/screens/question_screen/components/options.dart';
import 'package:actpod_mental_test/screens/question_screen/components/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Question(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 400.h,
              child: Options(),
            ),
          ],
        ),
      ),
    );
  }
}