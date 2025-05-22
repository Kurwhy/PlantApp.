import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/profile/profile_screen.dart';

import '../constants.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });

  if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildNavItem("assets/icons/flower.svg", 0),
            buildNavItem("assets/icons/heart-icon.svg", 1),
            buildNavItem("assets/icons/user-icon.svg", 2),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String iconPath, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SvgPicture.asset(
        iconPath,
        color: _selectedIndex == index ? kPrimaryColor : Colors.grey,
        width: 24,
        height: 24,
      ),
    );
  }
}
