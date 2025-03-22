import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/repositories/question.dart';
import 'package:actpod_mental_test/screens/question_screen/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Question extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionNum = ref.watch(questionNumProvider);
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/question_card.svg', // Replace with your actual SVG file
            width: isPhone ? 300.w : 140.w,
            fit: BoxFit.fitWidth, // Ensures the image scales well
          ),
          SizedBox(
            width: isPhone ? 250.w : 100.w,
            child: Text(
              questionRepository.getQuestions()[questionNum].question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isPhone ? 20.sp : 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Ensure visibility (adjust color if needed)
              ),
            ),
          ),
        ],
      ),
    );
  }
}