import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    return SvgPicture.asset(
      'assets/images/homepage_words.svg',
      width: isPhone? 500.w : 320.w,
      fit: BoxFit.cover,
    );
  }
}