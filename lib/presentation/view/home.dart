import 'package:al_huda/components/app_local.dart';
import 'package:al_huda/core/custom_widgets/bottomIconImage.dart';
import 'package:flutter/material.dart';

import 'hadith.dart';
import 'payerTimes.dart';
import 'quran.dart';
import 'sepha.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreen = 0;

  dynamic screens = [
    const PrayerTimesScreen(),
    const QuranScreen(),
    const HadithScreen(),
    const TasbeehScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: screens[currentScreen]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFb7935f),
          selectedLabelStyle: const TextStyle(fontSize: 13),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex:
              currentScreen, // it is very important to make change in style of label
          onTap: (int index) {
            setState(() {
              currentScreen = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: BottomIconsImage(
                  imageName:
                      'assets/images/bottomNavigationBarIcons/mosque.png',
                  color: currentScreen == 0 ? Colors.white : Colors.black,
                ),
                label: '${getLang(context, 'Prayer Times')}'),
            BottomNavigationBarItem(
                icon: BottomIconsImage(
                  imageName: 'assets/images/bottomNavigationBarIcons/quran.png',
                ),
                label: '${getLang(context, 'Quran')}'),
            BottomNavigationBarItem(
                icon: BottomIconsImage(
                  imageName:
                      'assets/images/bottomNavigationBarIcons/hadeth.png',
                ),
                label: '${getLang(context, 'Hadeth')}'),
            BottomNavigationBarItem(
                icon: BottomIconsImage(
                  imageName: 'assets/images/bottomNavigationBarIcons/sepha.png',
                ),
                label: '${getLang(context, 'Sepha')}'),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                  size: 28,
                ),
                label: '${getLang(context, 'Settings')}'),
          ],
          //very important
          type: BottomNavigationBarType
              .fixed, // This ensures all items are fixed and the background color is applied correctly
        ),
      ),
    );
  }
}
