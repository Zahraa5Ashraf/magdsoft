import 'package:flutter/material.dart';
import 'package:magdsoft/theme.dart';

class imageCard extends StatelessWidget {
  const imageCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      // shadowColor: AppColor.kTextColor2,
      color: AppColor.kwhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image), fit: BoxFit.contain),
          borderRadius: BorderRadius.circular(20),
          color: AppColor.kwhite,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
