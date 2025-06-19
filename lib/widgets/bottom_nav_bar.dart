import 'package:flutter/material.dart';

class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor:
          brightness == Brightness.light ? Colors.black : Colors.white,
      unselectedItemColor:
          brightness == Brightness.light ? Colors.black54 : Colors.white70,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Deals'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Businesses'),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
