import 'package:al_huda/core/custom_widgets/profile_card.dart';
import 'package:al_huda/core/utils/myConstants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String routeName = 'Settings Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        'assets/images/background.jpeg'), // Change accordingly
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ProfileCard(title: 'الاسم', value: 'رحاب حمدي'),
            ProfileCard(title: 'البريد الالكتروني', value: 'rehab@gmail.com'),
            ProfileCard(title: 'كلمة المرور', value: '************'),
            ProfileCard(
                title: 'تاريخ الميلاد', value: '23/05/1995', showArrow: true),
            ProfileCard(
                title: 'البلد/ المحافظه', value: 'القاهره', showArrow: true),
            const SizedBox(height: 24),
             Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.appColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: const Text('Save changes',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
