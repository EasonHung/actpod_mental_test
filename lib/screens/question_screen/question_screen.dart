import 'package:actpod_mental_test/screens/question_screen/components/options.dart';
import 'package:actpod_mental_test/screens/question_screen/components/question.dart';
import 'package:actpod_mental_test/screens/question_screen/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    final questionNum = ref.watch(questionNumProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_mobile.png"), // Path to your PNG file
            fit: BoxFit.cover, // Covers entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              logo(isPhone),
              questionNumText(questionNum, isPhone),
              SizedBox(
                height: isPhone? 4.h : 10.h,
              ), 
              Question(),
              SizedBox(
                height: isPhone? 50.h : 20.h,
              ),
              SizedBox(
                height: isPhone? 300.h : 380.h,
                child: Options(),
              ),
              SizedBox(
                height: isPhone? 60.h : 0.h,
              )
            ],
          ),
        ),
      )
    );
  }

  Widget questionNumText(int questionNum, bool isPhone) {
    return Text(
      (questionNum + 1).toString().padLeft(2, '0'),
      style: TextStyle(
        fontSize: isPhone? 20.sp : 10.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
  
  Widget logo(bool isPhone) {
    return Image.asset(
      "assets/images/logo.png",
      width: isPhone? 120.w : 30.w,
      fit: BoxFit.fitWidth
    );
  }
}