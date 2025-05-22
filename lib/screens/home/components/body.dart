import 'package:flutter/material.dart';
import 'package:activity_maps_photo/constants.dart';

import 'featured_plants.dart';
import 'header.dart';
import 'recommended_plants.dart';
import 'title_with_more_btn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Menggunakan SingleChildScrollView untuk scroll pada perangkat kecil
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size),
          TitleWithMoreBtn(title: "Recommended", press: () {}),
          RecommendedPlants(),
          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}