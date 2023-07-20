import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft/components/buttonrounded.dart';
import 'package:magdsoft/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/routes.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

final FocusNode _textFieldFocusNode1 = FocusNode();
final FocusNode _textFieldFocusNode2 = FocusNode();

final FocusNode _textFieldFocusNode3 = FocusNode();
final FocusNode _textFieldFocusNode4 = FocusNode();
String pin1 = '6';
String pin2 = '5';
String pin3 = '2';
String pin4 = '3';

class _OTPFormState extends State<OTPForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
          padding: const EdgeInsets.only(
            top: 120.0,
            right: 40,
            left: 40,
          ),
          child: Form(
              child: Column(
            children: [
              Text(
                'Verify Phone',
                style: TextStyle(
                  fontSize: 40,
                  color: AppColor.kwhite,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 90,
              ),
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
                          blurRadius: 15,
                        ),
                      ],
                      color: AppColor.kwhite,
                    ),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child: Container(
                        // Use the focusNode to track the focus state
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: _textFieldFocusNode1.hasFocus
                                ? Colors.blue
                                : Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              pin1 = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          focusNode: _textFieldFocusNode1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 15,
                        ),
                      ],
                      color: AppColor.kwhite,
                    ),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child: Container(
                        // Use the focusNode to track the focus state
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: _textFieldFocusNode2.hasFocus
                                ? Colors.blue
                                : Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              pin2 = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          focusNode: _textFieldFocusNode2,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 15,
                        ),
                      ],
                      color: AppColor.kwhite,
                    ),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child: Container(
                        // Use the focusNode to track the focus state
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: _textFieldFocusNode3.hasFocus
                                ? Colors.blue
                                : Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              pin3 = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          focusNode: _textFieldFocusNode3,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 15,
                        ),
                      ],
                      color: AppColor.kwhite,
                    ),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child: Container(
                        // Use the focusNode to track the focus state
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: _textFieldFocusNode4.hasFocus
                                ? Colors.blue
                                : Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              pin4 = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          focusNode: _textFieldFocusNode4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              TextButton(
                child: Text(
                  'Resend Code',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColor.kPrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 40,
              ),
              Mainbutton(
                  text: 'Verify',
                  press: () {
                    verify();
                  }),
            ],
          )),
        ),
      ),
    );
  }

  void verify() async {
    /* UNCOMMENT WHEN SERVER ONLINE */
    Map<String, dynamic> body = {
      "code": "${pin1}${pin2}${pin3}${pin4}",
      "phone": "01111111111",
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    var url = Uri.parse("https://magdsoft.ahmedshawky.fun/api/otp");

    var response = await http.post(url,
        headers: {
          'content-Type': 'application/json',
        },
        body: jsonBody,
        encoding: encoding);

    var data = json.decode(response.body);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(data.toString())));
    if (response.statusCode == 200) {
      Navigator.of(context).pushNamed(
        RouteGenerator.home,
      );
    }
  }
}
