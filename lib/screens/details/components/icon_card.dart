import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class IconCard extends StatelessWidget {
  final String icon;
  final VoidCallback? press;

  const IconCard({
    required this.icon,
    this.press,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press ?? () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        padding: EdgeInsets.all(kDefaultPadding / 2),
        height: 62,
        width: 62,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 22,
              color: kPrimaryColor.withOpacity(0.22),
            ),
            BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: Colors.white,
            ),
          ],
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}