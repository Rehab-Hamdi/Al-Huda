import 'package:al_huda/core/custome_widgets/prayerTime.dart';
import 'package:al_huda/core/utils/myConstants.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});
  static const String routeName = "home";

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  late int endTime;

  @override
  void initState() {
    super.initState();
    // Set the countdown duration (e.g., 2 minutes from now)
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getScreenHeight(context);
    double screenWidth = ScreenUtils.getScreenWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: screenHeight * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Asr',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text('3.11',
                          style:
                              TextStyle(fontSize: 25, color: Colors.orange))
                    ],
                  ),
                  //Use CountdownTimer
                  CircularCountDownTimer(
                    width: screenWidth * 0.40,
                    height: screenHeight * 0.33,
                    initialDuration: _calculateInitialDuration()
                        .inSeconds, // Convert to seconds
                    duration:
                        _calculateDuration().inSeconds, // Convert to seconds
                    //backgroundColor: Colors.black,
                    ringColor: Colors.white,
                    fillColor: const Color(0xFFb7935f),
                    textStyle: const TextStyle(
                      fontSize: 28.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textFormat: CountdownTextFormat.HH_MM_SS,
                    strokeWidth: 8.0,
                    strokeCap: StrokeCap.round,
                    isReverse: false,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    onComplete: () {
                      //print('Countdown Ended');
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PrayerTimesModel(
                        imageName: 'assets/images/prayerTimesIcons/sun.png',
                        prayerName: 'الظهر',
                        prayerTime: '11.41 am'),
                    PrayerTimesModel(
                        imageName:
                            'assets/images/prayerTimesIcons/sunrise-am.png',
                        prayerName: 'الشروق',
                        prayerTime: '5.14 am'),
                    PrayerTimesModel(
                        imageName: 'assets/images/prayerTimesIcons/fog.png',
                        prayerName: 'الفجر',
                        prayerTime: '3.53 am'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PrayerTimesModel(
                        imageName: 'assets/images/prayerTimesIcons/night.png',
                        prayerName: 'العشاء',
                        prayerTime: '7.24 pm'),
                    PrayerTimesModel(
                        imageName:
                            'assets/images/prayerTimesIcons/sunrise-pm.png',
                        prayerName: 'المغرب',
                        prayerTime: '6.6 pm'),
                    PrayerTimesModel(
                        imageName:
                            'assets/images/prayerTimesIcons/partly-cloudy.png',
                        prayerName: 'العصر',
                        prayerTime: '3.11 pm'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Duration _calculateInitialDuration() {
    // Get the current time
    DateTime currentTime = DateTime.now();
    return Duration(
      hours: currentTime.hour,
      minutes: currentTime.minute,
      seconds: currentTime.second,
    );
  }

  Duration _calculateDuration() {
    // Replace this with the logic to determine the next prayer time
    // For demonstration, let's assume the next prayer time is 4:25 AM
    DateTime nextPrayerTime =
        DateTime.now().add(const Duration(hours: 8, minutes: 25, seconds: 60));

    // Calculate the difference between the next prayer time and the current time
    DateTime currentTime = DateTime.now();
    return nextPrayerTime.difference(currentTime);
  }
}
