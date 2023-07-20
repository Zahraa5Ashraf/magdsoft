import 'package:flutter/material.dart';
import 'package:magdsoft/components/item.dart';

import 'package:magdsoft/models/devices.dart';
import 'package:magdsoft/theme.dart';

class devicewidget extends StatefulWidget {
  const devicewidget(this._deviceItem);
  final DeviceItem _deviceItem;
  @override
  State<devicewidget> createState() => _devicewidgetState();
}

class _devicewidgetState extends State<devicewidget> {
  int fav = -1;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ItemScreen(widget._deviceItem)));
          // Navigator.of(context)
          //     .pushNamed(RouteGenerator.details, arguments: widget._deviceItem);
        },
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(top: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.kwhite,
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Image with shadow
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget._deviceItem
                          .image, // Replace with your network image URL
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                  top: 40,
                  right: 0,
                  child: IconButton(
                      onPressed: () {},
                      icon: IconButton(
                          onPressed: () {
                            setState(() {
                              fav = widget._deviceItem.id;
                            });
                          },
                          icon: Icon(Icons.favorite_sharp),
                          color: fav == widget._deviceItem.id
                              ? Colors.red
                              : AppColor.kPlaceholder1))),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_sharp,
                          color: AppColor.kwhite,
                        )),
                  )),
              Positioned(
                  top: 110,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget._deviceItem.company,
                        style: TextStyle(
                            fontSize: 20, color: AppColor.kPrimaryColor),
                      ),
                      Text(
                        widget._deviceItem.name,
                        style: TextStyle(
                            fontSize: 13, color: AppColor.kTextColor1),
                      ),
                      Text(
                        widget._deviceItem.price,
                        style: TextStyle(
                            fontSize: 12, color: AppColor.kTextColor1),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }


}
