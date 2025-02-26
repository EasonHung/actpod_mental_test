import 'package:actpod_mental_test/entities/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultDescription extends ConsumerWidget {
  final Result result;

  ResultDescription(this.result);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;

    return Text(
      result.description,
      style: TextStyle(
        fontSize: isPhone? 24.sp : 16.sp,
        color: Colors.black
      ),
    );
  }
}