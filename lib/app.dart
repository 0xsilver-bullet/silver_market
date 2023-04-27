import 'package:flutter/material.dart';
import 'package:silver_market/feature/home/home_screen.dart';
import 'package:silver_market/theme.dart';

class SilverMarketApp extends StatelessWidget {
  const SilverMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silver Market',
      theme: SilverAppTheme.light,
      darkTheme: SilverAppTheme.light,
      home: const HomeScreen(),
    );
  }
}
