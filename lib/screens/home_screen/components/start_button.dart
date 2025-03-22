import 'package:actpod_mental_test/screens/question_screen/question_screen.dart';
import 'package:actpod_mental_test/screens/story_screen/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StartButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;

    return InkWell(
      onTap: () {
        GoRouter.of(context).push('/story');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [
            Color(0xFFFFC837), // Lighter shade (top-left)
            Color(0xFFFF8008), // Darker shade (bottom-right)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(40.w)
        ),
        child: Text(
          "START",
          style: TextStyle(
            color: Colors.white,
            fontSize: isPhone? 28.sp : 24.sp,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}