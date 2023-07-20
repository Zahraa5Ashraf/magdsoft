import 'package:flutter/material.dart';
import 'package:magdsoft/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/buttonrounded.dart';
import '../components/inputfield.dart';
import '../components/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

var phone = '';
var name = '';

class _WelcomeScreenState extends State<WelcomeScreen> {
  void namechange(String value) {
    setState(() {
      name = value; // Update the value whenever the InputField changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 844,
        decoration: const BoxDecoration(
          color: AppColor.kPrimaryColor,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 322,
              child: Align(
                child: SizedBox(
                  width: 393,
                  height: 602,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 182,
              child: Align(
                child: SizedBox(
                  width: 309,
                  height: 300,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
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
            ),
            const Positioned(
              // welcomeCzd (2:6)
              left: 138,
              top: 208,
              child: Align(
                alignment:
                    Alignment.center, // Align the child (Text) to the center

                child: SizedBox(
                    width: 109,
                    height: 31,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ),
            Positioned(
              // rectangle4HmB (2:9)
              left: 75,
              top: 322,
              child: Align(
                child: InputField(
                  onChanged: (String value) {
                    setState(() {
                      phone = value;
                    });
                  },
                  hintText: 'Enter your Phone Number',
                  keyboard: TextInputType.phone,
                ),
              ),
            ),
            Positioned(
              // rectangle5ytu (2:10)
              left: 75,
              top: 260,
              child: Align(
                child: InputField(
                  onChanged: (String value) {
                    setState(() {
                      name = value;
                    });
                  },
                  hintText: 'Enter your Full Name',
                  keyboard: TextInputType.name,
                ),
              ),
            ),
            Positioned(
              // rectangle65h3 (2:11)
              left: 72,
              top: 400,
              child: Mainbutton(
                text: 'Login',
                press: () {
                  verify();
                },
              ),
            ),
            Positioned(
              left: 30.5,
              top: 580,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 29,
                      height: 25,
                      child: Text('OR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColor.kPrimaryColor,
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                        ),
                        child: Image.asset(
                          'assets/facebook.JPG',
                          width: 70,
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                        ),
                        child: Image.asset('assets/apple.JPG', width: 70),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                        ),
                        child: Image.asset(
                          'assets/google.JPG',
                          width: 70,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verify() async {
    /* UNCOMMENT WHEN SERVER ONLINE */
    Map<String, dynamic> body = {
      "name": "Ali Khaled",
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
        RouteGenerator.auth,
      );
    }
  }
}
