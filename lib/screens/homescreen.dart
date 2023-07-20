import 'package:flutter/material.dart';
import 'package:magdsoft/components/categories.dart';
import 'package:magdsoft/models/category.dart';
import 'package:magdsoft/models/devices.dart';
import 'package:magdsoft/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({
    super.key,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

List<DeviceItem> deviceslist = [];

Future<List<DeviceItem>> getData2() async {
  var url = Uri.parse("http://magdsoft.ahmedshawky.fun/api/getProducts");
  var response = await http.get(url);
  var responsebody = jsonDecode(response.body);

  if (responsebody['products'] != null) {
    for (var product in responsebody['products']) {
      DeviceItem device = DeviceItem(
        id: product['id'],
        company: product['company'],
        name: product['name'],
        type: product['type'],
        price: product['price'],
        image: product['image'],
        description: product['description'],
      );
      deviceslist.add(device);
    }
  }

  return deviceslist;
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DeviceItem>>(
        future: getData2(), // Step 2: Use getData2() as the future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the data is being fetched
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // If data is fetched successfully
            List<DeviceItem> deviceslist = snapshot
                .data!; // Get the list of DeviceItem objects from the snapshot

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.kPrimaryColor,
                    AppColor.kwhite,
                  ],
                  stops: [0.0, 0.4],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 20,
                  right: 20,
                  //bottom: 20,
                ),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          hintStyle: TextStyle(
                                            color: AppColor.kTextColor2,
                                          ), // Hint text
                                          border: InputBorder
                                              .none, // Remove the default underline
                                        ),
                                      ),
                                    ),

                                    Icon(
                                      Icons.search,
                                      color: AppColor.kTextColor2,
                                    ), // Leading search icon
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 47,
                              width: 50,
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
                              child: Icon(
                                Icons.filter_alt,
                                color: AppColor.kTextColor2,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              //   horizontal: 10.0.w,
                              ),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  color: AppColor.kForthColor,
                                  borderRadius: BorderRadius.circular(
                                    12.r,
                                  ),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/imagelaptop.JPG'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                  top: 120,
                                  left: 8,
                                  child: Text(
                                    'New Release',
                                    style: TextStyle(
                                      color: AppColor.kAccentColor,
                                    ),
                                  )),
                              Positioned(
                                  top: 140,
                                  left: 8,
                                  child: Text(
                                    'Acer Predator Helios 300',
                                    style: TextStyle(
                                      color: AppColor.kAccentColor,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Category(),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recommended \nFor You',
                              style: TextStyle(
                                fontSize: 25,
                                color: AppColor.kTextColor2,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GridView.count(
                              primary: false,
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              childAspectRatio: (1 / 1.5),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              children: List.generate(deviceslist.length,
                                  (index) => devicewidget(deviceslist[index])),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
