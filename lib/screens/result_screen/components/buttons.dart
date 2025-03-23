import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
            again(context, isPhone),
            const Spacer(),
            share(context, isPhone),
            const Spacer(),
            download(isPhone),
            const Spacer(),
          ],
        ));
  }

  Widget again(BuildContext context, bool isPhone) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go('/');
      },
      child: Container(
        width: isPhone ? 120.w : 64.w,
        height: isPhone ? 36.h : 52.h,
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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: isPhone? 16.w : 8.w),
        )),
      ),
    );
  }

  Widget share(BuildContext context, bool isPhone) {
    return InkWell(
      onTap: () {
        String currentUrl = html.window.location.href;
        Clipboard.setData(ClipboardData(text: html.window.location.href));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('已複製連結到剪貼簿'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: Container(
          width: isPhone ? 120.w : 64.w,
          height: isPhone ? 36.h : 52.h,
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
              "分享結果",
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: isPhone? 16.w : 8.w
              ),
            ),
          )),
    );
  }

  Widget download(bool isPhone) {
    return InkWell(
      onTap: () async {
        String url;
        if (kIsWeb) {
          final userAgent = html.window.navigator.userAgent.toLowerCase();
          if (userAgent.contains('iphone') || userAgent.contains('ipad')) {
            url = 'https://apps.apple.com/tw/app/actpod/id6468426325'; // iOS App Store link
          } else if (userAgent.contains('android')) {
            url = 'https://play.google.com/store/apps/details?id=com.sharevoice&hl=zh_TW&pli=1'; // Android Play Store
          } else {
            url = 'https://play.google.com/store/apps/details?id=com.sharevoice&hl=zh_TW&pli=1'; // Fallback for desktop web
          }
        } else {
          // Not web: Use Platform class
          if (Platform.isIOS) {
            url = 'https://apps.apple.com/tw/app/actpod/id6468426325';
          } else if (Platform.isAndroid) {
            url = 'https://play.google.com/store/apps/details?id=com.sharevoice&hl=zh_TW&pli=1';
          } else {
            url = 'https://play.google.com/store/apps/details?id=com.sharevoice&hl=zh_TW&pli=1';
          }
        }

        // Launch the URL
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        } else {
          debugPrint("Could not launch $url");
        }
      },
      child: Container(
          width: isPhone ? 120.w : 64.w,
          height: isPhone ? 36.h : 52.h,
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: isPhone? 16.w : 8.w),
            ),
          )),
    );
  }
}
