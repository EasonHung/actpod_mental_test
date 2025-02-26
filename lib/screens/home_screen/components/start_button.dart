import 'package:actpod_mental_test/screens/question_screen/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => QuestionScreen())
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Color(0xffff9f20),
          borderRadius: BorderRadius.circular(20.w)
        ),
        child: Text(
          "開始測驗",
          style: TextStyle(
            fontSize: isPhone? 28.sp : 24.sp,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}