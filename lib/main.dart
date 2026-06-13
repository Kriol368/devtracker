import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DevTrackerApp());
}

class DevTrackerApp extends StatefulWidget {
  const DevTrackerApp({super.key});

  @override
  State<DevTrackerApp> createState() => _DevTrackerAppState();
}

class _DevTrackerAppState extends State<DevTrackerApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
      _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevTracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: const Scaffold(
        body: Center(
          child: Text('DevTracker - Fase 0'),
        ),
      ),
    );
  }
}