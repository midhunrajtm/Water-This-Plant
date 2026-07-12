import 'package:flutter/material.dart';
import 'package:water_this_plant/theme/app_theme.dart';
import 'package:water_this_plant/screens/login_screen.dart';

void main() {
  runApp(const WaterThisPlantApp());
}

class WaterThisPlantApp extends StatelessWidget {
  const WaterThisPlantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water This Plant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
