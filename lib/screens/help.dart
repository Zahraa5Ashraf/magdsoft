import 'package:flutter/material.dart';
import 'package:magdsoft/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/buttonrounded.dart';
import '../components/helpCard.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class Help {
  final int id;
  final String question;
  final String answer;

  Help({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory Help.fromJson(Map<String, dynamic> json) {
    return Help(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}

List<Help> helpList = [];

Future<List<Help>> getData() async {
  var url = Uri.parse("http://magdsoft.ahmedshawky.fun/api/getHelp");
  var response = await http.get(url);
  var responsebody = jsonDecode(response.body);
  helpList.clear();
  if (responsebody['help'] != null) {
    for (var helpJson in responsebody['help']) {
      Help help = Help.fromJson(helpJson);
      helpList.add(help);
    }
  }

  return helpList;
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: FutureBuilder<List<Help>>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Help> helpData = snapshot.data!;
                    return Container(
                      decoration: const BoxDecoration(
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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            'Help',
                            style: TextStyle(
                              color: AppColor.kwhite,
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),

                            // Use ListView.builder to create the helpCard widgets
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: helpData.length,
                              itemBuilder: (context, index) {
                                Help help = helpData[index];
                                return helpCard(
                                  title: help.question,
                                  desc: help.answer,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Mainbutton(
                            text: 'Continue',
                            press: () {},
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
