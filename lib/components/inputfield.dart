import 'package:flutter/material.dart';
import 'package:magdsoft/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  const InputField({
    this.textInputAction,
    this.onChanged,
    this.controller,
    this.isPassword = false,
    this.hintText,
    this.validateStatus,
    this.sufficon,
    this.backgroundcolor,
    this.height,
    this.keyboard,
  });
  final TextInputType? keyboard;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final FormFieldValidator? validateStatus;
  final IconButton? sufficon;
  final Color? backgroundcolor;
  final int? height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 247,
          height: 45,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.kwhite,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0, 0),
                  blurRadius: 3.5,
                ),
              ],
            ),
            child: TextFormField(
              keyboardType: keyboard,
              obscureText: isPassword,
              controller: controller,
              textInputAction: textInputAction,
              validator: validateStatus,
              onChanged: onChanged,
              cursorColor: AppColor.kPrimaryColor,
              style: Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                //labelText: hintText,
                suffixIcon: sufficon,
                filled: true,
                fillColor: AppColor.kwhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                  borderSide: BorderSide.none,
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColor.kTextColor2,
                  fontSize: 14.sp,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
