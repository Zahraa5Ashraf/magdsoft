import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft/models/devices.dart';
import '../theme.dart';
import 'imagescard.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen(
    this._item,
  );
  final DeviceItem _item;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

final List<String> specificcards = [
  'assets/item1.JPG',
  'assets/item2.JPG',
  'assets/item3.JPG',
  'assets/item4.JPG',
];

class _ItemScreenState extends State<ItemScreen> {
  Color selectedTap = AppColor.kTextColor1;
  Color unselectedTap = AppColor.kTextColor2;

  int selection = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.kPrimaryColor,
                AppColor.kwhite,
              ],
              stops: [0.0, 0.6],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 5,
                        ),
                      ],
                      color: AppColor.kwhite),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColor.kTextColor2,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget._item.name,
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColor.kwhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Type: ${widget._item.type}',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColor.kwhite,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 340,
                    height: 280,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget._item.image),
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffffffff),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildcard(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffffff),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0, 4),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/acer.jpeg'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0, 4),
                              blurRadius: 8,
                            ),
                          ],
                          color: AppColor.kPlaceholder2),
                    ),
                    title: const Text('Acer Official Store'),
                    subtitle: const Text(
                      'view store',
                      style: TextStyle(color: AppColor.kTextColor2),
                    ),
                    trailing: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0, 4),
                              blurRadius: 5,
                            ),
                          ],
                          color: AppColor.kPlaceholder2),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.kPrimaryColor,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            color: AppColor.kTextColor2,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          widget._item.price,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InsideButton(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = 1;
                        });
                      },
                      child: Text(
                        'OverView',
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                selection == 1 ? selectedTap : unselectedTap),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = 2;
                        });
                      },
                      child: Text(
                        'Specifications',
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                selection == 2 ? selectedTap : unselectedTap),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = 3;
                        });
                      },
                      child: Text(
                        'Review',
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                selection == 3 ? selectedTap : unselectedTap),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                if (selection == 1)
                  SizedBox(
                    child: Text(
                      widget._item.description,
                      style: TextStyle(color: AppColor.kTextColor2),
                    ),
                  ),
                if (selection == 2)
                  SizedBox(
                    child: Text(
                      widget._item.description,
                      style: TextStyle(color: AppColor.kTextColor2),
                    ),
                  ),
                if (selection == 3)
                  SizedBox(
                    child: Text(
                      widget._item.description,
                      style: TextStyle(color: AppColor.kTextColor2),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildcard() {
    return specificcards.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: EdgeInsets.only(
              left: 16.0.w,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 8.h,
                right: 8.w,
              ),
              child: Row(
                children: List.generate(
                  specificcards
                      .length, // Use the length of specificcards list as the count
                  (index) => Row(
                    children: [
                      imageCard(
                          image: specificcards[
                              index]), // Use the URL from the specificcards list
                      SizedBox(
                        width: 16.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class InsideButton extends StatelessWidget {
  const InsideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.kPrimaryColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 4),
                blurRadius: 5,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color?>(AppColor.kPrimaryColor),
            ),
            child: const Text(
              'Add to Cart',
              style: TextStyle(
                  color: AppColor.kwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          )),
    );
  }
}
