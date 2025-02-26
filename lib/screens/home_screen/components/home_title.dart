import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    return Text(
      "ActPod 心理測驗",
      style: TextStyle(
        fontSize: isPhone? 36.sp : 24.sp,
        color: Colors.black
      ),
    );
  }
}