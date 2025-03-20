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
    final size = MediaQuery.of(context).size;
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
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: size.width, // Ensure it covers the full width
              height: 760.h, // Adjust height (50% of screen height)
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(result.imagePath), // Result image
                  fit: BoxFit.fitWidth, // Ensures the width is fully covered
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}