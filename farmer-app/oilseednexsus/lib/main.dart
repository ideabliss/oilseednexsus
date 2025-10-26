import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/main_navigation_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const OilseedNexusApp());
}

class OilseedNexusApp extends StatelessWidget {
  const OilseedNexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oilseed Nexus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      routes: {
        '/main': (context) => const MainNavigationScreen(),
      },
    );
  }
}