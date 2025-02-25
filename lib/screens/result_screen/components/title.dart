import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../entities/result.dart';

class ResultTitle extends ConsumerWidget {
  final Result result;

  ResultTitle(this.result);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      result.title,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    );
  }
}