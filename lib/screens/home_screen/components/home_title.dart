import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    return Image.asset(
      'assets/images/homepage_words.png',
      width: isPhone? 500.w : 320.w,
      fit: BoxFit.cover,
    );
  }
}