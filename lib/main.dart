import 'package:flutter/material.dart';
import 'package:magdsoft/screens/help.dart';
import 'package:magdsoft/screens/tabscreen.dart';
import 'package:magdsoft/components/item.dart';
import 'package:magdsoft/screens/splashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft/screens/welcome.dart';

import 'components/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magdsoft',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: RouteGenerator.welcome,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
