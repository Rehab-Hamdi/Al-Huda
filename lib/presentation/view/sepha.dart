import 'package:flutter/material.dart';

class SephaScreen extends StatelessWidget {
  const SephaScreen({super.key});
  static const String routeName = 'Sepha Screen';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('Sepha Screen'),
      ),
    ));
  }
}
