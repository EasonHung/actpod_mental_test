import 'package:actpod_mental_test/screens/question_screen/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
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
              SizedBox(height: isPhone? 0.h : 120.h),
              story(isPhone),
              SizedBox(height: 60.h),
              startButton(context),
              SizedBox(height: isPhone? 80.h : 100.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget story(bool isPhone) {
    return SizedBox(
      width: 300.w,
      child: Text(
        '''傳說中，有一座隱藏在世界角落的魔法森林，只會向那些追求極致的人開放。這座森林充滿了神秘的力量，迴盪著傳奇 PODCASTER 的低語，每一陣風吹過，都蘊含著說話的藝術。這裡沒有固定的道路只有不同的試煉在等待你 -- 你將磨練自己的聲音、內容、風格，甚至挖掘與觀眾建立深層連結的秘訣。
     
為了成為最強PODCASTER，你決定前往這座森林修行
        ''',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isPhone? 16.w : 8.w,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }

  Widget startButton(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;

    return InkWell(
      onTap: () {
        GoRouter.of(context).push('/question');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 12.h),
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
          "進入森林",
          style: TextStyle(
            color: Colors.white,
            fontSize: isPhone? 28.sp : 12.sp,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}