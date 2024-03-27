import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String routeName = 'Settings Screen';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Settings Screen'),
          ),
        ));
  }
}
