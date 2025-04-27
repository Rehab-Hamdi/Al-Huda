import 'package:al_huda/components/app_local.dart';
import 'package:al_huda/manager/cubit/hadith_cubit.dart';
import 'package:al_huda/manager/cubit/prayer_time_cubit.dart';
import 'package:al_huda/manager/cubit/quran_cubit.dart';
import 'package:al_huda/manager/cubit/surah_cubit.dart';
import 'package:al_huda/presentation/view/hadith.dart';
import 'package:al_huda/presentation/view/home.dart';
import 'package:al_huda/presentation/view/payerTimes.dart';
import 'package:al_huda/presentation/view/quran.dart';
import 'package:al_huda/presentation/view/settings.dart';
import 'package:al_huda/presentation/view/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PrayerTimeCubit()..getAllPrayerTimes(),
        ),
        BlocProvider(
          create: (context) => QuranCubit()..getQuran(),
        ),
        BlocProvider(
          create: (context) => SurahCubit()..getSurah(),
        ),
        BlocProvider(
          create: (context) => HadithCubit()..getHadiths(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale("ar", ""),
          //Locale("en", ""),
        ],
        localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.languageCode == currentLang.languageCode) {
                //mySharedPreferences.setString("lang",currentLang.languageCode) ;
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
        debugShowCheckedModeBanner: false,
        title: 'Al_Huda',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (c) => const SplashScreen(),
          HomeScreen.routeName: (c) => const HomeScreen(),
          SettingsScreen.routeName: (c) => const SettingsScreen(),
          QuranScreen.routeName: (c) => const QuranScreen(),
          HadithScreen.routeName: (c) => const HadithScreen(),
          PrayerTimesScreen.routeName: (c) => const PrayerTimesScreen(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
