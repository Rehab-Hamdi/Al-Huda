import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard(
      {super.key,
      required this.title,
      required this.value,
      this.showArrow = false});
  final String title;
  final String value;
  bool? showArrow;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        trailing: showArrow == true ? const Icon(Icons.arrow_drop_down) : null,
      ),
    );
  }
}
