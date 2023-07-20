import 'package:flutter/material.dart';
import 'package:magdsoft/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kPrimaryColor,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 7.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.JPG',
                    alignment: Alignment.topCenter,
                    height: 90,
                    width: 150,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
