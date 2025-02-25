import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "ActPod 心理測驗",
      style: TextStyle(
        fontSize: 24.sp,
        color: Colors.black
      ),
    );
  }
}