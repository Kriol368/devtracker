import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'pages/home_page.dart';

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
  String _locale = 'es';
  bool _initialized = false;
  late AppLocalizations _localizations;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkMode') ?? false;
    final locale = prefs.getString('locale') ?? 'es';
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      _locale = locale;
      _localizations = AppLocalizations.of(_locale);
      _initialized = true;
    });
  }

  void _toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final newMode =
    _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setState(() => _themeMode = newMode);
    await prefs.setBool('isDarkMode', newMode == ThemeMode.dark);
  }

  void _toggleLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final newLocale = _locale == 'es' ? 'en' : 'es';
    setState(() {
      _locale = newLocale;
      _localizations = AppLocalizations.of(_locale);
    });
    await prefs.setString('locale', newLocale);
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: AppTheme.primaryIndigo,
            ),
          ),
        ),
      );
    }

    final isDarkMode = _themeMode == ThemeMode.dark;

    return MaterialApp(
      title: 'DevTracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: HomePage(
        isDarkMode: isDarkMode,
        onToggleTheme: _toggleTheme,
        onToggleLocale: _toggleLocale,
        localizations: _localizations,
      ),
    );
  }
}