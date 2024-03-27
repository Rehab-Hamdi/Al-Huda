import 'package:flutter/material.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});
  static const String routeName = 'Hadeth Screen';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('Hadeth Screen'),
      ),
    ));
  }
}
