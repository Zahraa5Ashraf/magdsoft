import 'package:flutter/material.dart';
import 'package:magdsoft/models/category.dart';

import '../theme.dart';

class Category extends StatefulWidget {
  const Category({
    super.key,
  });

  @override
  State<Category> createState() => _CategoryState();
}

List<Categoryitem> categories = [
  Categoryitem(image: 'assets/prize.JPG', title: 'All', index: 0),
  Categoryitem(image: 'assets/shape.JPG', title: 'Acer', index: 1),
  Categoryitem(image: 'assets/icongreen.JPG', title: 'Razer', index: 2),
];

class _CategoryState extends State<Category> {
  int selectedCat = 0;

  Color selected = AppColor.kwhite;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedCat = index;
              });
            },
            child: Card(
              // shadowColor: AppColor.kTextColor2,
              color: AppColor.kwhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: selectedCat == index
                      ? AppColor.kPrimaryColor
                      : AppColor.kwhite,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.kwhite,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0, 4),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(categories[index].image),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50, // Adjust the position of the text as needed
                      child: Text(
                        categories[index]
                            .title, // Replace this with your desired text
                        style: TextStyle(
                          color: selectedCat == index
                              ? AppColor.kwhite
                              : AppColor.kTextColor1,
                          // Set the text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
