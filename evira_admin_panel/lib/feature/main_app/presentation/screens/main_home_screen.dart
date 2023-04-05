import 'package:evira_admin_panel/feature/main_app/presentation/screens/analytics/analytics_screen.dart';
import 'package:flutter/material.dart';

import 'package:evira_admin_panel/core/asset_constants.dart' as asset;
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';

class MainHomeScreen extends StatefulWidget {
  static const routename = '/mainhomescreen';

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  List<Widget> screens = [AnalyticsScreen(), HomeScreen(), ProfileScreen()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: asset.introStyles(12),
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                asset.analytics,
                color: currentIndex == 0 ? Colors.black87 : Colors.black54,
                width: 25,
              ),
              label: "Analytics"),
          BottomNavigationBarItem(
              icon: Image.asset(
                asset.home,
                color: currentIndex == 1 ? Colors.black87 : Colors.black54,
                width: 25,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                asset.profile,
                color: currentIndex == 2 ? Colors.black87 : Colors.black54,
                width: 25,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
