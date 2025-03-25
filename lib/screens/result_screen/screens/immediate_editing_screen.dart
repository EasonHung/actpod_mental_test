import 'package:actpod_mental_test/entities/answer.dart';
import 'package:actpod_mental_test/entities/result.dart';
import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/screens/result_screen/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ImmediateEditingResultScreen extends ConsumerWidget {

  ImmediateEditingResultScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_mobile.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: isPhone ? 0 : 30.h,
                bottom: 100, 
              ),
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(double.infinity),
                panEnabled: true,
                scaleEnabled: true,
                minScale: 0.5,
                maxScale: 4.0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: size.width,
                    minHeight: size.height,
                  ),
                  child: Image.asset(
                    isPhone
                        ? "assets/images/result3_mobile.png"
                        : "assets/images/result3_web.png",
                    fit: BoxFit.contain,
                    width: size.width,
                    height: size.height,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: isPhone ? 12.h : 32.h,
            left: 0,
            right: 0,
            child: Center(
              child: ResultButtons(),
            ),
          ),
        ],
      ),
    );
  }
}