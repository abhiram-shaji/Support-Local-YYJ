import 'package:flutter/material.dart';

import '../../theme_notifier.dart';
import '../../widgets/app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Settings'),
      body: ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (context, ThemeMode mode, _) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: mode == ThemeMode.dark,
                onChanged: (value) {
                  themeNotifier.value =
                      value ? ThemeMode.dark : ThemeMode.light;
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    content: Text('SupportLocalYYJ MVP'),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    content: Text('Privacy Policy Placeholder'),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Terms of Use'),
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    content: Text('Terms of Use Placeholder'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
