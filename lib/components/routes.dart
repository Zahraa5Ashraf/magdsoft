import 'package:flutter/material.dart';
import 'package:magdsoft/components/item.dart';
import 'package:magdsoft/screens/auth.dart';
import 'package:magdsoft/screens/homescreen.dart';
import 'package:magdsoft/screens/welcome.dart';

import '../models/devices.dart';
import '../screens/tabscreen.dart';

class RouteGenerator {
  static const String details = '/item';
  static const String home = '/tabscreen';
  static const String auth = '/auth';
  static const String welcome = '/welcome';
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case details:
        return MaterialPageRoute(
          builder: (_) => ItemScreen(settings.arguments as DeviceItem),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const TapScreen(),
        );
      case auth:
        return MaterialPageRoute(
          builder: (_) => const OTPForm(),
        );
      case welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const TapScreen(),
        );
    }
  }
}
