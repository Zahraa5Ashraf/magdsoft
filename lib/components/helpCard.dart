// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:magdsoft/theme.dart';

class helpCard extends StatelessWidget {
  const helpCard({
    super.key,
    required this.title,
    required this.desc,
  });
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        // Wrap ExpansionTile with Material
        color: Colors.white, // Set color to transparent
        borderRadius: BorderRadius.circular(10), // Set a large border radius
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 4),
                blurRadius: 5,
              ),
            ],
            color: AppColor.kwhite,
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ), // Remove extra padding
            title: Text(
              title,
              style: const TextStyle(color: AppColor.kPrimaryColor),
            ),
            // Contents
            children: [
              ListTile(
                tileColor: Colors.blue, // Background color of the ListTile
                title: Text(
                  desc,
                  style: const TextStyle(
                    color: AppColor.kTextColor2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
