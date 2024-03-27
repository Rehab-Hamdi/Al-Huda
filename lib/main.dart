import 'package:al_huda/presentation/view/hadeth.dart';
import 'package:al_huda/presentation/view/home.dart';
import 'package:al_huda/presentation/view/payertimes.dart';
import 'package:al_huda/presentation/view/quran.dart';
import 'package:al_huda/presentation/view/sepha.dart';
import 'package:al_huda/presentation/view/settings.dart';
import 'package:al_huda/presentation/view/spalsh_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al_Huda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (c) => const SplashScreen(),
        HomeScreen.routeName: (c) =>  const HomeScreen(),
        SettingsScreen.routeName: (c) => const SettingsScreen(),
        QuranScreen.routeName: (c) => const QuranScreen(),
        SephaScreen.routeName: (c) => const SephaScreen(),
        HadethScreen.routeName: (c) => const HadethScreen(),
        PrayerTimesScreen.routeName: (c) => const PrayerTimesScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
