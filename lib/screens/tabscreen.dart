import 'package:flutter/material.dart';
import 'package:magdsoft/screens/favs.dart';
import 'package:magdsoft/screens/help.dart';
import 'package:magdsoft/screens/homescreen.dart';
import 'package:magdsoft/screens/settings.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.logout_outlined),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_add_rounded),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "",
        )
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState?.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState?.pushReplacementNamed("favs");
        break;
      case 2:
        _navigatorKey.currentState?.pushReplacementNamed("Home");
        break;
      case 3:
        _navigatorKey.currentState?.pushReplacementNamed("Notifications");
      case 4:
        _navigatorKey.currentState?.pushReplacementNamed("Settings");
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "favs":
        return MaterialPageRoute(builder: (context) => favorites());
      case "Settings":
        return MaterialPageRoute(builder: (context) => HelpScreen());
      default:
        return MaterialPageRoute(builder: (context) => Homescreen());
    }
  }
}
