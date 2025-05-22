import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        primaryColor: const Color(0xFF0C9869),
        scaffoldBackgroundColor: const Color(0xFFF9F8FD),
        fontFamily: 'Cairo',
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xFF3C4046),
            ),
      ),
      home: HomeScreen(),
    );
  }
}