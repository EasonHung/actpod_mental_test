import 'package:actpod_mental_test/entities/answer.dart';
import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/screens/result_screen/components/buttons.dart';
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
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_mobile.png', // Replace with your background image path
              fit: BoxFit.cover, // Ensures it covers the entire screen
            ),
          ),
          Positioned(
            top: isPhone? 0 : 30.h,
            child: Container(
              width: size.width, // Ensure it covers the full width
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(isPhone? result.mobileImagePath : result.webImagePath), // Result image
                  fit: BoxFit.fitWidth, // Ensures the width is fully covered
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48.h,
            child: ResultButtons(),
          )
        ],
      ),
    );
  }
}