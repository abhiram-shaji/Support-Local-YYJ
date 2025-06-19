import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'screens/deals/deals_screen.dart';
import 'screens/directory/business_directory_screen.dart';
import 'screens/events/events_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'theme_notifier.dart';
import 'widgets/bottom_nav_bar.dart';

class SupportLocalApp extends StatefulWidget {
  const SupportLocalApp({super.key});

  @override
  State<SupportLocalApp> createState() => _SupportLocalAppState();
}

class _SupportLocalAppState extends State<SupportLocalApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DealsScreen(),
    const BusinessDirectoryScreen(),
    EventsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode mode, _) {
        return MaterialApp(
          title: 'SupportLocalYYJ',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: mode,
          home: Scaffold(
            body: _screens[_currentIndex],
            bottomNavigationBar: MainBottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ),
        );
      },
    );
  }
}
