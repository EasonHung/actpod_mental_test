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
    return Text(
      result.description,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black
      ),
    );
  }
}