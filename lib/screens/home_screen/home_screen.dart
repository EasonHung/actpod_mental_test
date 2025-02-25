import 'package:actpod_mental_test/screens/home_screen/components/home_title.dart';
import 'package:actpod_mental_test/screens/home_screen/components/start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeTitle(),
            SizedBox(height: 12.h,),
            StartButton()
          ]
        )
      ),
    );
  }
}