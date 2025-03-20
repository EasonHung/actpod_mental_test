import 'package:actpod_mental_test/screens/home_screen/components/home_title.dart';
import 'package:actpod_mental_test/screens/home_screen/components/start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
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
              HomeTitle(),
              SizedBox(height: 60.h),
              StartButton(),
              SizedBox(height: isPhone? 100.h : 100.h),
            ],
          ),
        ),
      ),
    );
  }
}