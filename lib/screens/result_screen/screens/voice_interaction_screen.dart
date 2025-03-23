import 'package:actpod_mental_test/entities/answer.dart';
import 'package:actpod_mental_test/entities/result.dart';
import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/screens/result_screen/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class VoiceInteractionResultScreen extends ConsumerWidget {

  VoiceInteractionResultScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_mobile.png', // Replace with your background image path
              fit: BoxFit.cover, // Ensures it covers the entire screen
            ),
          ),
          Positioned(
            top: isPhone ? 0 : 30.h,
            child: Container(
              width: size.width,
              height: size.height,
              child: InteractiveViewer(
                panEnabled: true, // allows dragging
                scaleEnabled: true, // allows zooming
                minScale: 1.0,
                maxScale: 4.0, // you can adjust this
                child: Image.asset(
                  isPhone
                      ? "assets/images/result6_mobile.png"
                      : "assets/images/result6_web.png",
                  fit: BoxFit.fitWidth,
                  width: size.width,
                  height: size.height,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: isPhone? 24.h : 32.h,
            child: ResultButtons(),
          )
        ],
      ),
    );
  }
}