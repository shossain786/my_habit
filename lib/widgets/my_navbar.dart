import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_habit/main.dart';
import 'package:my_habit/screens/home_screen.dart';

import '../screens/activity_table_screen.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: kColorScheme.onPrimaryContainer,
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: kColorScheme.onSecondary,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: kColorScheme.primary,
            color: kColorScheme.onPrimaryContainer,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.work_history_sharp,
                text: 'Activities',
              ),
              GButton(
                icon: Icons.star_border_rounded,
                text: 'Muat\'la',
              ),
              GButton(
                icon: Icons.verified_user,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                debugPrint('Tab pressed: $_selectedIndex');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _navigateToScreen(_selectedIndex),
                    ));
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _navigateToScreen(int index) {
    if (index == 1) {
      return ActivityTableScreen();
    } else {
      return const HomeScreen();
    }
  }
}