import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultButtons extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          again(isPhone),
          const Spacer(),
          share(isPhone),
          const Spacer(),
          download(isPhone),
          const Spacer(),
        ],
      )
    );
  }

  Widget again(bool isPhone) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: isPhone? 120.w : 100.w,
        height: isPhone? 36.h : 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Soft black shadow
              blurRadius: 10, // How blurry the shadow is
              offset: Offset(0, 4), // x and y offset
            ),
          ],
        ),
        child: Center(
          child: Text(
            "再測一次",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.w
            ),
          )
        ),
      ),
    );
  }

  Widget share(bool isPhone) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: isPhone? 120.w : 100.w,
        height: isPhone? 36.h : 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Soft black shadow
              blurRadius: 10, // How blurry the shadow is
              offset: Offset(0, 4), // x and y offset
            ),
          ],
        ),
        child: Center(
          child: Text(
            "分享",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.w
            ),
          ),
        )
      ),
    );
  }

  Widget download(bool isPhone) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: isPhone? 120.w : 100.w,
        height: isPhone? 36.h : 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Soft black shadow
              blurRadius: 10, // How blurry the shadow is
              offset: Offset(0, 4), // x and y offset
            ),
          ],
        ),
        child: Center(
          child: Text(
            "下載ACTPOD",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.w
            ),
          ),
        )
      ),
    );
  }
}