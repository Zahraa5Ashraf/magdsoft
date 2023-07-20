import 'package:flutter/material.dart';

import '../theme.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({
    super.key, required this.text, required this.press,
  });
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 45,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.kPrimaryColor,
          ),
          child: ElevatedButton(
            onPressed: press as VoidCallback,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color?>(AppColor.kPrimaryColor),
            ),
            child: Text(
              text,
              style: const TextStyle(
                  color: AppColor.kwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          )),
    );
  }
}
